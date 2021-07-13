Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366F63C7930
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jul 2021 23:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbhGMVts (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Jul 2021 17:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhGMVts (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Jul 2021 17:49:48 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4E1C0613DD
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 14:46:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hr1so44192505ejc.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jul 2021 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ywm+gK026pGNqzZzWkXHXl/JmzlRHZrhjXMr5NX3cc0=;
        b=NmxD/HNs6vP9G6kBa5010BhawkLJ0E+t1PxwUo++bNEg3K+yK6M8c7qa8sh0qZe5km
         1XKYbr7iHmmNSIRjgkN1zhOhFO+wBaqaCkGBVpLbxxEW0PpeTQ1XoJdE/glewttWdOlJ
         +odZ9msQgDrAn6CroCU9E4I3QDKNBXQr0wjapdJJRffpAdoeShrKVgJ08KqYTQzz/qyP
         kZSXKJf8ZHOB1Go0Dmfeodfkpg8WTRpF95YbN1P1x1onxKfCYkD9S3MXDVdIHN6ZYd9O
         JWUTC/E3OoMU+XghrMf+3AgkG2V3iaaTYK/hJpOA6rUG3b2j71uhxusTR7luFhXq2aKk
         pcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ywm+gK026pGNqzZzWkXHXl/JmzlRHZrhjXMr5NX3cc0=;
        b=bGfT+EA5lYYl86iiuxVQen1A306ctWj8ELqZFrFibo5g5ltZ8mf02X5AUYDz9wDfWC
         QPKfTMYys3YSshTov/ExkbOTqxpQvQGfAYXrldIGwAj7yeOo38nJZyeSNaZ2jrenV0aW
         cv+5TUpOJehPsysHft1gALgvYF83ZPGmzeYT8tDyKMLfHv7KKlsoxDCe9hbut43LIcOZ
         mGGecBemru/dNr9+bbVhvhb637HP4zadYmzdS/hwPn/ZQdI4uMuXSAcGBqF/HttWJF6k
         913EK9tZP31DtA2Mrubtj4BIJXvD3hitHxl71b0WxdwPOLDpiqNdOnSw3t3iB8TSPCIf
         DwWQ==
X-Gm-Message-State: AOAM530TRLZG751cDiX+Vo6e+MyAVUDpXGqjU/zwSky00c8Zr+iagY66
        iPNIWPmy3ka1w3u4YwlRNILReOHbKTZvdQ==
X-Google-Smtp-Source: ABdhPJzKdvUTgjjfyVGzJGMejotv6kft+3euqhURDDWSE3NlX1c/huX/a0G8NTNJ74Qrpqm3x9gBNQ==
X-Received: by 2002:a17:906:b794:: with SMTP id dt20mr8240824ejb.431.1626212814818;
        Tue, 13 Jul 2021 14:46:54 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id ee29sm104299edb.39.2021.07.13.14.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 14:46:54 -0700 (PDT)
Date:   Tue, 13 Jul 2021 23:46:52 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] How stable is the v2 API?
Message-ID: <20210713214651.GB8031@cephalopod>
References: <20210712210836.GA3636@cephalopod>
 <CAMRc=McqKfzS8EVA-RUitZMwn_TFQEzU2AOuTTxvcdSX+xLj2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McqKfzS8EVA-RUitZMwn_TFQEzU2AOuTTxvcdSX+xLj2Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 10:10:12PM +0200, Bartosz Golaszewski wrote:
[...]
> While - as you already assumed - there are no commitments to any API &
> ABI stability yet, the interface should not change very much. I have a
> single set of API changes in my queue that we discussed while
> reviewing the C++ bindings and I don't expect there to be many more
> coming after that.

Is that single set of API changes the same as
<https://patchwork.ozlabs.org/project/linux-gpio/list/?series=250005>
or do you have more beyond that?

> Again: this is an estimation, not a promise.

Understood.

Thanks,

Ben.
