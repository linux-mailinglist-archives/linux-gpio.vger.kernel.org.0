Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0488D146F42
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 18:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgAWRMM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 12:12:12 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:36988 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgAWRMM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 12:12:12 -0500
Received: by mail-io1-f66.google.com with SMTP id k24so3708366ioc.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 09:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mIIAYeW/67RwaR6brLjqtohs/0zFHmgUmZs9vUDZr54=;
        b=r4Ye6viez3DYwVBjXsMGsvM7dvT8Ap+7yndgw1/hH+P7hHP81aLCg5X+2xK6WFtpTN
         c/fiZgrEA126YnUmeLMESslAV0+wYbbJod3HpoVPBgV9sq5dnZs0TZr5Yyrhmi3mR2Xl
         S27R62Tj7WpwNF+XYc5lMFbu21+5ZBySxvFvw2AKOqH4MSo5zuMN4yf22Afm1reS7zWY
         KhSkQmnOajFUEQ/mO7NNDNRp18LKT0eAhbPj7J3g0dKsDlgVqUQ1UwVsxQuDQiNsDDQe
         oOKzIa58+ZUn0zijbZQhXiPeSt07PpkoUthZmJzPQ+VXPVFZNWWQIMJXq/6solOWkQZI
         6c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mIIAYeW/67RwaR6brLjqtohs/0zFHmgUmZs9vUDZr54=;
        b=IraX68Y9Qwt5CLeV5DHaIL7pbxSocifMtDSI3e/Q4UtkKabmcyRhaayvCgV7H/U+C1
         3Ke/rYwdoEntL8tMXK5bEkigG7uUeKlxP4PXlBpxvDLN7l8kiaVrtG3HB7dGNeadF3Kr
         bLUYI3h/gsv5UlI04HLf2rsaMWlDdo9l45ib5GoQ2mblx2k+MdPCKqfFvh37uqvy1lFo
         WQvFh6S49GtDi0iIvYNIyODtdy2xaBbDFcCf4lnmcenit2EO4FIPE2HM6nyjsA4bfOJL
         J8Huw7EMyzNOP+ytC5YoVYmCQTW6fdyWYtYsm/r+B1TGTODRDjMzNXvWjRxljw1Yk9e6
         R6ZA==
X-Gm-Message-State: APjAAAWb3t+jxFnpfP+oRqPCroEpCPEOk57q7bjlo4mVyl7U5UaZr2KX
        HhvDafKFctbeH57Y7VA509IZM2p9FZm8lL1plLOiPI4q
X-Google-Smtp-Source: APXvYqwGBXYpREym3Z6WcuMzwqCsLxxUkcVtE06O/GBE6mfgh+bUxG5rSWh4AiA9wHCNecuCckBcUCjUJF7fgF2v2Yo=
X-Received: by 2002:a02:c85b:: with SMTP id r27mr20530jao.57.1579799531598;
 Thu, 23 Jan 2020 09:12:11 -0800 (PST)
MIME-Version: 1.0
References: <92120a07-6945-1be9-15de-9e9a461c45bc@nisbet.kiwi.nz>
In-Reply-To: <92120a07-6945-1be9-15de-9e9a461c45bc@nisbet.kiwi.nz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jan 2020 18:12:00 +0100
Message-ID: <CAMRc=MdGSEbN3hD36E9npc8KjM3oxp-oE89OJqcEgsVc1Nbrnw@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH] iter: remove unnecessary indirection in free_dirs
To:     "Nisbet, Chris" <chris@nisbet.kiwi.nz>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 18 sty 2020 o 02:30 Nisbet, Chris <chris@nisbet.kiwi.nz> napisa=C5=82=
(a):
>
> It is not necessary to pass the address of the 'dirs' variable to
> dirs_free(), so this commit removes the unnecessary indirection.
>
> Signed-off-by: Chris Nisbet <chris@nisbet.kiwi.nz>

Hi Chris,

this looks good but it doesn't apply on top of current master. Can you
rebase it and resend?

Bartosz
