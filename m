Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD23F5E419
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 14:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfGCMk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 08:40:59 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:34525 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfGCMk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 08:40:59 -0400
Received: by mail-wm1-f52.google.com with SMTP id w9so2843840wmd.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=REnOeEN5yGA6DyLHYZUXObOyZCyVPJqos2PFAeloT7k=;
        b=tozxBVBj8Zx3/S4JOAkF4a5m+vhqYKE2FZcfa+qH6ELSArafWHyGRNUtG6pNYT7Ovt
         R3w4RriHSl55srSSXoSz60ResDvaxdxcBnlkj77F1MXPQ82WER6328sXmSyr5Z/EMTin
         kAZt+LVQ3GpKa9SEdo5HpNqtgLpy66dR5K8Djxhcrqms6IOr5yD+bp93WooNpo0sBFbv
         TGgkW76J/K7eDePQ7M63uxp8HWfr5Jom2D9uQA5KFDp+H3ySKnVMtExmwcvKwU1UfH8C
         bPoMr/V3aIqJ9xwS5Nyy04U+/UEKh5x/GE1NtHu/xl/qRUSD744fvS0ieYvdzSYsxMnV
         HdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=REnOeEN5yGA6DyLHYZUXObOyZCyVPJqos2PFAeloT7k=;
        b=DHjXreGAGgsOMgGMz4zaRNmTImvzyv09uTmybGyasBdpOuQ/wV+a8AaHqqbWLl7rnF
         D8E8nm60/qmi1wcKdgUBgZEvugCDagCgJZTpsl5j+lY1aVXdXMPFejfvEmtsqr+nRPnn
         gYSWX2ZADceJryAx9eY2bHHNqDsqgCokEYuF5PderN4WBbglLpuGcBU6eUS9gtK66D5V
         j7ZJVisLDJPnUwYD9xEANw9tvbzNA1eUqijx+M6l8uWU7O9+jZTwEqfaNcxsisIhxzr9
         Qy+LAntXu2XZ0MGb7hTQ9ZgjJFgklkZQkMwY6KvXeADSBwxTGgnFN9asFBnpUhFyM7sE
         Xf+A==
X-Gm-Message-State: APjAAAWS5yz88k6kqodEloNHCpFLqc8wMErYSrMsSHaF+/hAv3AmsaTV
        itz5HZc9+be5awViXdaFQoKuvJn3B1/s5A==
X-Google-Smtp-Source: APXvYqzv39vxjEOuFXIZd2izLbkL+W+voUSFY7XUgtQYBiXS3oC/SBtBaMlJedbypMkeWFSaJyc9mQ==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr2879582wml.97.1562157657223;
        Wed, 03 Jul 2019 05:40:57 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c65sm2327372wma.44.2019.07.03.05.40.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 05:40:56 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        amergnat@baylibre.com
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <301695b6-52ba-92b1-ca1a-d4d587b33eeb@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-5-narmstrong@baylibre.com> <CAFBinCA1gUUbEj=++1rGcFQ1RdyxSheofAo=TKw3-UaenFAcug@mail.gmail.com> <301695b6-52ba-92b1-ca1a-d4d587b33eeb@baylibre.com>
Date:   Wed, 03 Jul 2019 14:40:55 +0200
Message-ID: <1jo92b70ko.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 03 Jul 2019 at 13:45, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 01:16, Martin Blumenstingl wrote:
>> +Cc Alexandre Mergnat
>> 
>> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>
>>> Add a setup() callback in the eeclk structure, to call an optional
>>> call() function at end of eeclk probe to setup clocks.
>>>
>>> It's used for the G12A clock controller to setup the CPU clock notifiers.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> this will probably work fine, but I want do double check first
>> 
>> are we planning to get rid of meson-eeclk (mid-term)?
>
> AFAIK no, but maybe I'm not aware of it !
>
> Neil
>
>> Alex has some patches to get rid of all these IN_PREFIX logic.

The prefix logic will go away with Alex's rework, so are the input clock
But meson-eeclk, which is just a common probe function do avoid
repeating the same things over and over, will stay

>> I'm asking because if we want to get rid of meson-eeclk it may be the

May I ask why ?

>> time to do so now to have less logic to migrate later on
>> 
>> 
>> Martin
>> 
