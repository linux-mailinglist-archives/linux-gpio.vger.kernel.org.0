Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AD44A7BCF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 00:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243238AbiBBXjG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 18:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiBBXjG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 18:39:06 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3329DC06173B
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 15:39:06 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 23so3517571ybf.7
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 15:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpbPkbhHKCL1jkMxCSu3j+IP3px1jyA2L5DaQThLjmM=;
        b=PRqEoX3NALne9rfjrS/rhhQhS2eaw4PRm8+rovUvPFO4Whq3cFEB+0Ejkgrh6Ktu57
         Oop4fa3n4++zl26aG/T/LHmq2G6NP5V32/bAujhZZ6iCmd9mTsFwEPI0DKd7SeGY65PF
         xehwwJi6gyZqN7rSQcFRk9K2jJe3yjiMfE5M+h0piCM0qLugR4GOoaz5fIVuYz4bcKLc
         uc/tLKNY5s8MSk9ZBpyYqTyPlEpa+S0Nel/0eFDqpafpKnTzlGlCWsPYwB+5RzfyxqSW
         FJ7xzPjyz0PnWEEaXcjdIO2lk4wSHBtMfTB7SxCEtCLCMRJiIGFMJMp/qpCW+fxWWHRZ
         lb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpbPkbhHKCL1jkMxCSu3j+IP3px1jyA2L5DaQThLjmM=;
        b=8Rf8DvZSu/PljUjBdXHDL5WsgZvEskXYcgDxAg4/G0D+TcGDeODKF+jh9aEy7GGoRr
         4U7wBU+0qJMLQhbUB6L/7FQAFc4eU5bqqQUYPIJExTcXJ0CvK9g5CzzG2+7b3Gm8BfeO
         +pL87Opk/8TCHfg3DBgRmXmRRkCHvC8D3o4/PjCOfZ0LIzdb+iz1TaW+4HO+n0jB/hmn
         KmlTBDdIGomFW5Clu+PI1kywZe1rtGRDens7NAchiE40kGtFZWN7ztc7+XAxMJ9ev1Lf
         QF/80UWGlWiMAPW0qdypr5tC/QdFYRn68OHqYmusD+gAKFR/fVVn0kTbru+UWC9jwdEe
         sgtw==
X-Gm-Message-State: AOAM531jSzW2NJqEs+oulPUDjs1E+lSbthzizieyMiwEwXG25uP3SPtE
        8fH+ovSSOzDOPvgUvjUcc2r+fn+HtMHPX8rz66F+xg==
X-Google-Smtp-Source: ABdhPJz/jjrriNNle4c10Xmkx/FGjzD6biAb60s26WMECGdM0QTrPdZRScnMt2kXh6S0nM/yMScoiApfxnv6vdSXwkk=
X-Received: by 2002:a25:5143:: with SMTP id f64mr47044018ybb.520.1643845145451;
 Wed, 02 Feb 2022 15:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20220125131858.309237-1-horatiu.vultur@microchip.com>
In-Reply-To: <20220125131858.309237-1-horatiu.vultur@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Feb 2022 00:38:54 +0100
Message-ID: <CACRpkdaCq7wwh4cObQ4zsw3uyf3_-M8RHtsF43csTpmQV9v3Cg@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: ocelot Add support for ServalT
To:     Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 25, 2022 at 2:18 PM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:

> This patch series adds support for ServalT pinctrl.

Patches applied!

Yours,
Linus Walleij
