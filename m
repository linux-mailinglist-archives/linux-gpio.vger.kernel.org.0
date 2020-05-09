Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18841CC39A
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 20:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEISFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 14:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726214AbgEISFj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 May 2020 14:05:39 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECABC061A0C;
        Sat,  9 May 2020 11:05:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id f12so4105349edn.12;
        Sat, 09 May 2020 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iylAZ67afhJneULmpXD8hs6yG6pA0hAdphybTMdL2Tg=;
        b=jh95EKvvRqh0/JOFoEYMmmqP/RxTQ/Wg7UWF3kmx0h6XIYkTSyiAkJK/ZYctPIC0Ug
         HObErDXhrfaNdXfjkhTu/9Czr3G8PiYtiOFECWsQeJAEI+8J4lhBXc015AaSRi3hqPGX
         TNT2Mwb0Pq8CffJmqCRO6LB9xuKITunVAg2OskNUwZQIR6lPVEzQSRg02HGeerSRB291
         NmkkDvBIetQGDiJsmZ6U/JcWeGO1HlrJIhsbwXv28Ni+ZilxdgagfGQ4m8xaZKMdCpWQ
         gsmwXsJ0m8LR/E0M/n/qqPOekKqdgJcRxy/H6qeyTPQQweEXL9GaeS7fBDIfP8IA0zd+
         I8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iylAZ67afhJneULmpXD8hs6yG6pA0hAdphybTMdL2Tg=;
        b=gG4DbmNWmeX1/QYNbRbTBal05JCAY6w1r19Fit2Uzmcakk+/Y2qFeE9L2X4kLH0Ee9
         nbX4s1lARlBl6RZcIYGXW62ruxODkUbpNIEDOyYXhx50OOA/7FTJJr8Sq//uvSHaJKZJ
         gJHjKCrcIyHZWULPv/OKA2cM9uQOhI5ZB0m23t28IBe0SMYEOLEaez3fL+kJQ++47P4U
         lGAtnxFx3MHohHhWMaBm/fi5O0Du7aZUqxtS7Pdbe8Fx87yKHGK4UkweKL5XqecnJXcZ
         LJyVL5PgowVQiaeS7wfvamDeYdJ1Z0fH1iM6xt229oCOO+T8hhzVxZK5fkTbpNQCdX5t
         EHWg==
X-Gm-Message-State: AGi0PubKKVbUqDj7lnCCanlyo2291BFUkITZpOKwU6mlVdUYZfuBmOBG
        sSlvuZfMOWN3LiJzdNnVixYpqRCOeod9NAaVu/Y=
X-Google-Smtp-Source: APiQypLoVDkS1aQi1ev2bBIGhd/Kk0xDc7qFO2h8NcA8QPs7gLtSAv8Zf+9cQ3JJ5J3F/s78XtFuBW5tjzAK4SyZt3w=
X-Received: by 2002:a05:6402:391:: with SMTP id o17mr7109516edv.71.1589047536466;
 Sat, 09 May 2020 11:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200509103956.26038-3-hui.song_1@nxp.com> <20200509103956.26038-2-hui.song_1@nxp.com>
 <20200509153315.GR208718@lunn.ch> <20200509172724.GG1551@shell.armlinux.org.uk>
In-Reply-To: <20200509172724.GG1551@shell.armlinux.org.uk>
From:   Amit Tomer <amittomer25@gmail.com>
Date:   Sat, 9 May 2020 23:34:59 +0530
Message-ID: <CABHD4K_tPkCherpY5zUtxV1wcKc=7aj3ayr9yxG-sLFZeMf3Dw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] armv8: gpio: add gpio feature
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>, u-boot@linux.nxdi.nxp.com,
        Hui Song <hui.song_1@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        jiafei.pan@nxp.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> From what I can tell, these patches are not for the kernel.  The
> filenames don't match th kernel layout.

These files looks to be from U-boot, and must be intended for U-boot
as I see U-boot mailing
address in recipient's address?
