Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049BF1F3278
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 05:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgFIDEf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 23:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgFIDEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 23:04:34 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424D5C03E969
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 20:04:34 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b7so550175pju.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 20:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=roY2DUP6PGfGdF9jvnr0wNIbNsAp3oLLbFqbF+gLNBc=;
        b=BtLw0//4jfIKzhR6vZ1OBiVXeFM2PdjMArNUBbO+1C29/lD20FHHWGO11D04qaCB6l
         CQ+a61ABz15aNUgKyXtOS3J2pm1j+vMZf2GCequtkFIxG4vuzvRs3bzWK3Tx+6zriunG
         cct0bIhVyHdy+meocsVmB/TQTPg59okn4pVmm+qO8HK1UcsxrWxa952xxbWNiqXeH3zR
         sQby8D9QLbEdPNe4bRZ6tdHwI7G7KXVgwQxHNjMFAkCeHgPYTj90cv8+bdTtib9vBtNF
         oJUg3j67j7e0r167rEP2ENuHVmvcBAY0AktwAlRO+5LejkA9mlPUX2Q81+lab9ogogKM
         hv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=roY2DUP6PGfGdF9jvnr0wNIbNsAp3oLLbFqbF+gLNBc=;
        b=d/4jHDTt+Kehemdih5JnZCZqRyVTYbmRdYqK3YQTUW5mtCbkdGN9ME0Zjq95fH8oG3
         Yfq5+FlNFO+7WAdGPOFVQlfRlB6AoHtsBXIHakXJwXtqNT5W9Iq28JA0n82r5euHTwXj
         GTsEvjlrDDxdhusBnLoVoVEtURdmVB8QLP+DAUbzcjDnZM60ynMiprkaug/hCMGHfPPo
         zooeXju4TzT4lBbO2pg+6Tq9qJwSeXWJI9kUWxZlOZGSlDnfOaqHXvNu7BScaK3+ekm2
         D7F69h4bOkciHuMqDEyLEmqbajGyvfDfXSXpU9eQUPHiiMH5B4dU4xbLJg3D0j/Q2fKI
         5bTQ==
X-Gm-Message-State: AOAM533uaFu7JL8B0JyNZICHjL1QFXuesgqWCbL/rTbktH+J5uKhm8Im
        TYN8Z68musoQ7mbEqPn86lKiKnhb
X-Google-Smtp-Source: ABdhPJxxTmrMz+i7OMJDZuaEuA1fcxZrQV1BykqNxcLJ8UBgh6w7hKQ/qlTXMICuZG4d8My2E1CidQ==
X-Received: by 2002:a17:902:d914:: with SMTP id c20mr1465645plz.269.1591671873231;
        Mon, 08 Jun 2020 20:04:33 -0700 (PDT)
Received: from [192.168.1.110] (c-69-254-151-52.hsd1.nm.comcast.net. [69.254.151.52])
        by smtp.gmail.com with ESMTPSA id j2sm799384pjf.4.2020.06.08.20.04.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 20:04:32 -0700 (PDT)
Subject: libgpiod users - implementations.
To:     linux-gpio@vger.kernel.org
References: <20200608231211.3363633-1-sashal@kernel.org>
 <20200608231211.3363633-293-sashal@kernel.org>
From:   R C <cjvijf@gmail.com>
Message-ID: <86872514-9c3f-136f-75ea-5fe3087bd398@gmail.com>
Date:   Mon, 8 Jun 2020 21:04:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608231211.3363633-293-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,


because of the email address, and from what I read in the content of 
emails, this is mostly (or probably all) about development?


Is there some "user activity" too?  I am interested in using libgpiod 
for reading senors etc.


thanks,


Ron


