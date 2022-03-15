Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C45114D9485
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 07:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345161AbiCOGVU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 02:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240909AbiCOGVT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 02:21:19 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB8645AC1;
        Mon, 14 Mar 2022 23:20:04 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id dr20so38156920ejc.6;
        Mon, 14 Mar 2022 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uflOwtUGg1izDwkmA4xRHZXY2C86sXCaglry8tcOahg=;
        b=XRuvaiqFAk4qobG6aA75vdGIZJi6SHw5AthrnnPDuXehrptnxYB+1C6YExFtikl5dx
         RXUww2xe7yAQZL1fqJtg6op9V45gm8yKcpGJH/Uvc7n4hBieg8D5YhbmOe0/q+CERC8G
         hBCcgKXew/Oq6v3e8qrsfJjmFu72Sf4bZaYrS/GZm4MN/a/2N6iQAi4Q4tp+f0xx2+Bs
         5jtQOBQ8HdMd7ZmX2Lw0RqcXmnTAIffti2B4jpe20z7IM/yhwPA53hwA//2MAy2V/e/c
         8FUCaEMcVm0tD2TNhGba1nBq7Th1/cY9cTQPQkH0eVM1M5H3tTGwstBQiTl5OS8w65Bb
         Gflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uflOwtUGg1izDwkmA4xRHZXY2C86sXCaglry8tcOahg=;
        b=O6DBZOw3mr55XMBO8UMmtkner/IG1tPva6Lq8c4BOVueziiEXH8jLQOlyp14BXVMi5
         lib2UICQ2ZOs8GvVLMP/tMVr427j/P0gK+3vPFSR5L0GJ7qh6IZZk1P3g6ZFJP4VA+s2
         44hwR8qVaLiVtZ9imeKKma6axCsUcxRnR/zyi+V9OkajYeNPPkrMl95mF8g2L8cXAggI
         7LH/9YnQqOrueRZwPlZubR3yIxtPwc9L9eSm5Vh6CartiUXqFM2G0QkebG5203NiltAF
         MsYOFipbHJBApZ0jsaINAkRYcmr0p6/FJk3RO+mPBS7vwTn+z1U5L1zafLJqjq1KqJeN
         fX3g==
X-Gm-Message-State: AOAM533CX8h/apdLucOACv30Yai6Bp90PfVIlg7nWOG7jsNbGGyoeInq
        rPo+qMtyR4RgyHMlubWvKCCvf+9PSGnUsnkLmDc=
X-Google-Smtp-Source: ABdhPJyKb5GBPbyAC7wf9c67MF5u3gefdQwh5K6VkEOcb4za79AKaqqXk7zYY7k3U4pV7gPoty7oDcvAphrlfzG41Lo=
X-Received: by 2002:a17:907:6e01:b0:6d0:562c:e389 with SMTP id
 sd1-20020a1709076e0100b006d0562ce389mr21493706ejc.497.1647325203231; Mon, 14
 Mar 2022 23:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com> <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
In-Reply-To: <CACRpkdbDWrrDPK9=5NErtM81109qtTHyFcTON=zXtB2B86wAdA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 15 Mar 2022 08:19:27 +0200
Message-ID: <CAHp75Ve9s+hEjhWwdjbRJhEU-Efno_TyAUH+D7iRrE8enivvtg@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail:
 Add pinconf,group + function for the pmu_clk"
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 15, 2022 at 3:01 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Feb 24, 2022 at 5:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> > Hello Intel pinctrl maintainers,
> >
> > As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
> > "pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".
>
> I suppose this is for Andy possibly I already pulled the pulled tree.

Nope, but it appears not necessary. We have nothing to update in my
tree which is dependent on this PR.


-- 
With Best Regards,
Andy Shevchenko
