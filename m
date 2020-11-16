Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024D72B4E9E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 18:58:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732415AbgKPRzp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 12:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731834AbgKPRzp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 12:55:45 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9412DC0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 09:55:43 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id u19so20126176lfr.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8oXlHe8u3Fee1MenlAvpCM4l/Kt/yN49TDHEUVPKoYo=;
        b=eDod8hQZ5sJwHasXRTiRh4oWpEGbppqU0aH+67230zY6SfTWp1HGDFLYKkEWKco5Ae
         bueR0ykpU6RnI0gn9n2e9YYXjCb67sohI82CXVrAyMiTnZ0QC/yYau+ZYSkmG2gMZ1z0
         bZ0vBcgSQ+nT/dixudqU3ba5di0NQ/BpK6gojaqZlqIL8G6XytzZ/QZM0m0Rmwn1H5f5
         9x9/SVagDvzCYVgurMIJXHuG+WvDRrMOmoXaAvwQJMV3PHFKiKd+kPSdR7fjY23q6aWu
         ngc4LNUbuHHxVbbhtQ3DMJXlM8Sll08TZdyGXgCdMP3iOKAd+suB7cDcIIuc9sc7Stwn
         Gmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8oXlHe8u3Fee1MenlAvpCM4l/Kt/yN49TDHEUVPKoYo=;
        b=ZwTtLLzkL0iyiM8GFoAjWvWjLPMfhXWl5Ixo51uV0NyptoVzll4/TtFVM7p3PAJGCg
         UYkKj/tNBRQwReWsYvnDwi4tIpxaeBpzmtpYh4Q9QYNdjj/R9Ft4CCPt/D3Tr9U4j5cT
         1xouO7Ob6M4D+mcY22EBQRJQfTRVgxwfNenze2pcK832LdISVUXeYaG0xo8k8g256U1H
         /53g+oP3XLm8YnsloRZxRy5u2QfUAr4YD/7/K4EJJRJhXxW8d/gmAeDykkD22mJZHlzd
         s447VnJpNXhStMyXzcrm5ze0Swqm/uiuGleijb326jUDVwxcXxWzjFY6UcyndPupX8tV
         wQQQ==
X-Gm-Message-State: AOAM531gyygPPVVkgfLPzdW67vG0ZbdhX5IUJfgtiPqplQyDJ7oqwsJe
        cGTIrnJDemG1t+OYdPjPRu69OYoxyYozaSxIh8c=
X-Google-Smtp-Source: ABdhPJxHlN4J4eNN7GnYAK5mWfeQgOaT4f+Emn43QxqtsyhI+CqenM6YjXua9hZpi086SUOkew/i6Ubj6i3gn3tgBHs=
X-Received: by 2002:ac2:4a91:: with SMTP id l17mr192993lfp.527.1605549342103;
 Mon, 16 Nov 2020 09:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20201116154407.15179-1-festevam@gmail.com> <65af91dc19822f5f164f23c3bc558a5d1b136440.camel@pengutronix.de>
In-Reply-To: <65af91dc19822f5f164f23c3bc558a5d1b136440.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 16 Nov 2020 14:55:30 -0300
Message-ID: <CAOMZO5CG+ZnK+x6Jk3U5864s5PJ2NcpzqHmYzG4703AKUBL4SQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Remove unused .id_table support
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Philipp,

On Mon, Nov 16, 2020 at 1:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> This seems to be missing conversion of the code that uses the matched
> of_device_id. That currently has to expect .data to be a pointer to
> struct platform_device_id.

Ops, you are right. I realized that I tested this on an imx7ulp-evk,
which does not use the gpio mxc driver.

Fixed as per your suggestion and tested on an imx6 board now :-)

Thanks
