Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D496A33B1A8
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhCOLqc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhCOLqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:46:12 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9E3C061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 04:46:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dx17so65660937ejb.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Mar 2021 04:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=pt0EGAnDHhFHYFRpEvKDIjX9c073joEzdDXcF/hq1hM=;
        b=IdBw87/SNifRk6QDeEiHwzGCevi1QUxkzSmF7R4HkFJ+kUMzmJiUf9tjcFbmYXD0O1
         9rF1ewjybxxV35yJl6kmANIAnJMug6+TeETL6vEAOTlmYYc+DN/EZn39B0Jp0RmXV+zY
         BFGsOrU5glhbIV2cnydChCN1ZqCIurMiLbaCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=pt0EGAnDHhFHYFRpEvKDIjX9c073joEzdDXcF/hq1hM=;
        b=gtaN1W7OH67GyzlvJdpIHKm0dSaxvQC+uGzpNeax2NgniDrmNsIkWFm4TUFLJHO3AA
         d4ljSrDtDGC7O9eWCq6zafpoqXo2csec4XWMW4y9UiBG+dBas69dsY9ES5qtPYkj1crr
         X2JRd4bQcEfjjf4SgqdhtyysjUVhqfzZB6C2fvGOaFH3a7w/6Tz23ppnRwscberlMtCQ
         IJXK+pZB0DkI5CqSQYCKvHw3yQ+juAkbzIiODvLtskaxWNJt3E3vsQno8YdqeP9y/Epz
         s5K1nbpix0jya+W6ygiDCk9vfDaLjDFKpBDyc3WkQFtWx8QVQZigTRSSIsFKBX6hrIQX
         k0GA==
X-Gm-Message-State: AOAM531VjPGY/oyyJoFI7CZG+LHWAF8Xg1l8cdg74mOc7CS0A1lpNGe6
        oOj5Ph9pdBismh5CPf+WdDSmZ6W5rKHchw==
X-Google-Smtp-Source: ABdhPJx7Y/lgtPUn9ulh4n9tuMN98kEALmpkzEfqNgNL2pA9JXb3f+MIvF/ICmKxsU5Em7l3aczS3w==
X-Received: by 2002:a17:907:20c7:: with SMTP id qq7mr22389336ejb.528.1615808770083;
        Mon, 15 Mar 2021 04:46:10 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id b12sm7699215eds.94.2021.03.15.04.46.08
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 04:46:09 -0700 (PDT)
To:     linux-gpio@vger.kernel.org
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: replacement for persistence of values written to sysfs files
Message-ID: <af518806-f473-8979-6d32-38c94a29b762@rasmusvillemoes.dk>
Date:   Mon, 15 Mar 2021 12:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I'm sure this has been asked before, so please just refer to me any old
thread(s) where this has been discussed.

In the bad old sysfs days, the value assigned to the gpio via the
/sys/class/... interface was persistent. So it was easy to use in shell
scripts etc. But gpioset very clearly states

Note: the state of a GPIO line controlled over the character device
reverts to default
when the last process referencing the file descriptor representing the
device file exits.
This means that it's wrong to run gpioset, have it exit and expect the
line to continue
being driven high or low. It may happen if given pin is floating but it
must be interpreted
as undefined behavior.

and I don't see anything in v2 of the uapi changing that.

So how is one supposed to get the kernel to set and maintain a value for
a gpio, without having to keep a dummy process around? Also, with the
sysfs interface, another process can later change the gpio value; I
don't think that's possible with a dummy process hanging onto it.

So, for example, one init script we have first configures a temperature
sensor with a high-temp alert threshold, and after that value has been
written, sets a gpio that will make such an alert trigger a reset of the
board. That gpio must of course stay set, but it cannot be set before
the threshold has been programmed. Then the init script starts a simple
service that periodically logs the temperature reading. A human being
working on the board can temporarily disable the alert-triggered reset
by just writing 0 to the gpio.

The README says

Additionally this project contains a set of command-line tools that should
allow an easy conversion of user scripts to using the character device.

but I don't see how to achieve the persistence (or ability by
third-party to temporarily change the value) provided by sysfs.

Rasmus
