Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA5155CDB7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345264AbiF1MjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344722AbiF1MjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:39:13 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DB32ED64
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:39:12 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id l11so21921500ybu.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MTpYKqpj1Ke2nAmzrM6LJJrYdhJ2JyjS8LNVvYtovMY=;
        b=LZ4njZtM/bVQo60epTjPQUxLOP5aP70PbLAod6eYk4b+5m4+pvXIbgAw+6FM9oQXWp
         fYbFM9x4zHrfsatqy64G8NP4VYffdEpd0F3fFz4czouhH2J4zKCdHcXHuv+9REqitFIl
         ca7OMcQZj49s03y1/vdx6QPl2Q7IFvSfIvXKuqgY6g0//qEb0odvsb+fcq2xGEBRdPHa
         K8pIeoNQV0Yspl5/H3nb9n4QBna/oTSysJY3EQIP2f0cqOpRcM8nckemGnWPb8PAqcie
         BfwS1L2wRN7/1rUbgtJVwCY8tzQGGaJmaGr5Yz+M4KlMjmskNpt5BkcQEBZDeSWSgeNU
         eO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MTpYKqpj1Ke2nAmzrM6LJJrYdhJ2JyjS8LNVvYtovMY=;
        b=G/HBe40A4mkrlMyJ7ex9HK4Aw/iOX4BCaS6qSWac3cmsPBELQ3YfLKzaLkjc+vXiam
         WUb8REtrccwlzSm7FLzZtzCMoh6flZs9PDfMkJJnA9SASS2PGRD+RY1Um+n9s5ttZ6Hd
         H4JA2MbiKaMDkNU62WPzdAHzq/qH2bud3re/c42pl6rj1uy/4FKzbIZ4X9eoT8uJD7Qv
         iAGygO1Oo6zu6GK2rY1QrBU1Eqsr2Kw8o7ZFUkbFqRCFu6ubL4tyazN62f5VJJD6fH06
         ZrBvNEmVrqhP+yzs6A3oq53L4aYBofh92GT5dBtLItyCXJDFE+RW9Gxr1t4BHDCn0V7U
         DqFQ==
X-Gm-Message-State: AJIora/DpP7zTxU9L2yjcM12ao8bks3ajC9I/6RP2Fxg+NXXReqKsjvK
        76BXITVJ2dGWIj7+k+Xlazo1upXMy+b3jaWmzT4YhR1zOVQ=
X-Google-Smtp-Source: AGRyM1vap6g56eXS4/X+EknzSt9CwmskqIiDkdBJiGLfUDZZWgN3Fs7uzox9wQbgYLZTCOLAW51Xy7ZFUvOkyb3jtBg=
X-Received: by 2002:a05:6902:152:b0:66c:e116:6a7 with SMTP id
 p18-20020a056902015200b0066ce11606a7mr9347506ybh.533.1656419951745; Tue, 28
 Jun 2022 05:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220620165053.74170-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220620165053.74170-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:39:00 +0200
Message-ID: <CACRpkdZrCd9vAMg+MOTduAhmZ+uRq9q89Ts6o6RagdTkrrpogA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: bcm: Convert drivers to use struct
 pingroup and PINCTRL_PINGROUP()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 20, 2022 at 6:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The pin control header provides struct pingroup and PINCTRL_PINGROUP() ma=
cro.
> Utilize them instead of open coded variants in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks very tasty. Can we get a test or ACK from one of the BCM
people? (=C3=81lvaro/Jonas)

Yours,
Linus Walleij
