Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FF444DC55
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 20:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhKKT4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 14:56:15 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33375 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbhKKT4O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 14:56:14 -0500
Received: by mail-oi1-f176.google.com with SMTP id q25so7974338oiw.0;
        Thu, 11 Nov 2021 11:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7ByQsMPZCiif5jkMe9qb5AaIl0yH5pqLoidiFqdV2TU=;
        b=E6ncShNyXQ/RYLnDsFwDtX4Gb6m4488mPOFRdAOIhosUzFtbZBFmrcox3nqFeA72W+
         9/0SQQA0cHNReMLGxA82izwHxrRWGFwdupU2iSDebCuN77sdtgQuAzP93DSwsfzcGfeL
         qKJV5LQqBxOU+pNrGG/njtC2xElMZP+I+C1th11q2+keSWqJCt6T6s1Xu+jtAUFVfvJ4
         sW20ZkWaT3CZCYRoxDI4iw8dxdGVuFiwP6yRYw8n8DUjYydnV6dOl7+u9NsV0msZjqTx
         zPwdjpxMdKvNrP+D7qoii59fc8O99cn39dz0Mvu4J9fTg7+ng9tQp7+AERo3mBiYAuh6
         VaHA==
X-Gm-Message-State: AOAM530jzrlzKiVlhdWixOmxaGGriUuud1m4+YJK8099Nn8v88v0nZxo
        A9MBb96PJ/PgeD7x6sE/VI69j4nKGA==
X-Google-Smtp-Source: ABdhPJxvHdjnPATaWjtPYOkkWLknkTtAQEZBhp9PtVy3pzJz2pNda+o5IGXpaAqTk4OAFRQ4lBf6MA==
X-Received: by 2002:a05:6808:238f:: with SMTP id bp15mr8407874oib.30.1636660401666;
        Thu, 11 Nov 2021 11:53:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i16sm873232oig.15.2021.11.11.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 11:53:20 -0800 (PST)
Received: (nullmailer pid 4189991 invoked by uid 1000);
        Thu, 11 Nov 2021 19:53:20 -0000
Date:   Thu, 11 Nov 2021 13:53:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        ext Tony Lindgren <tony@atomide.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: support specifying pins
Message-ID: <YY10sIZ7BdAebR59@robh.at.kernel.org>
References: <20211110231436.8866-1-zajec5@gmail.com>
 <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbAS0JiqTQUU0R0yRhVCwagubwsNYLxj1DLE1Ldc+H_JQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 04:31:28PM +0100, Linus Walleij wrote:
> On Thu, Nov 11, 2021 at 12:14 AM Rafał Miłecki <zajec5@gmail.com> wrote:
> 
> > While working with pinctrl in Linux I started wondering if we could
> > start specifying pins in DT instead of Linux drivers. When working with
> > DT we usually avoid hardcoding hardware description in drivers so it
> > isn't clear to me why it doesn't apply to pins.

I thought we were...

> Historically this is what pinctrl-single.c does.
> Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> 
> At the time we created pin control there was a bit back-and-forth and
> the conclusion was that there is not one-size-fits all for pin defines.
> 
> The reason TI (Tony) wanted to push the information into DT
> was that what he gets is a number of unprocessed ASIC datasets,
> that are then turned into tables with a script. Header files or DTS
> source alike, but some kind of tables.
> 
> At the time (2011?) it was unclear what kind of data should go into
> e.g. header and data files in the kernel (modules) and what should
> go into the DT. So the approach to put pin information into the DT
> was allowed for pinctrl-single.
> 
> The way I have understood it, DT maintainers have since gotten
> a bit wary about (ab)using the DT as a container for "anything data"
> and prefer that drivers contain details and derive these from
> compatible strings.
> 
> As of today, IIUC the DT maintainers are against this scheme.

The question is more can the data be static (complete) and correct? That 
doesn't work for quirk properties nor entire clock trees with a node per 
clock.

Pins? Maybe. That's a flat thing and you should know all the pins up 
front.

Rob
