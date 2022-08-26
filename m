Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97AEF5A2878
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 15:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344024AbiHZNZP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 09:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243036AbiHZNZO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 09:25:14 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE1922530
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:25:13 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-333a4a5d495so35304927b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+5rwRrMz6Vgpr3kuJ/Qy6k3D5LZq6ZW9xqvVpBwo1dA=;
        b=T/eL4/5hHoofaXhX9Y5APeNn3CoGJUkZD7XlLvCeI9p4CsNvhZq91jZX2DS5LIOLAA
         +6ZiQF3vnc1B5ZOYN3ZZESKE0AQJMeGdbv3v8YL0KospQUudBMJ+NjmHSPP3NEaCHLUO
         GM6MmX1gOvSVySc25t8BG24jR6U3HzsmTRbRjbOD83JKujYkvG3VXTis0nH3v9bO4nFM
         cEmw9sxqhZWvNHjsenUnWjuX2L8eInP5EOD1Ajj/B/d3LzpuOfnrJrv4qolSffd9saXG
         6k29HKmKrZpciz8nmVxgPUsuvpm/udctDMSCGZdDOV4ZkUxxA8OaUb4FS7CLS0xo1M+1
         FJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+5rwRrMz6Vgpr3kuJ/Qy6k3D5LZq6ZW9xqvVpBwo1dA=;
        b=TfAu+C3UF3Fme0UjuEVbGsyVCwRyuFx9dObd/6yLzGztISloQ8dc6hozhl7Dlpqrx5
         tF5ZEV2I2RDrc7WCo3LJIJ+8O0zl4DqL0u5l2ZrP2QX4ywvcOzfWD1Ta4enKBK2UEGVm
         E548pZ0kykyw0UWovma2pMIuLTXbMef9aVWJWOSfl7JRTJrx9tIZPqU0RF45SUmrTx+M
         /b5s+4CqovIELxG7ggJbbCl2SLxJ3pcvoJEWYk3uI1068Xg6kSJTCGE6a07zTB+qIuuN
         KJAD2JuW7qPB6NtF0fTJ9BLUx9GcTBzZFXvHM2HJW1varQ7ItSMhpydVD8NlvMs1j+yG
         cr1A==
X-Gm-Message-State: ACgBeo1K85WqxKuIT146k9ZpL8HAgLCYpLktcf7NnucmlY7QTj3jcPwn
        9s1g5t9xuPuNeZj2MXztLt+omDY5t6fEAw7pL1/7Jg==
X-Google-Smtp-Source: AA6agR527zHsKUzzsXeecDEZwR/Wz1n7Y8bEF0Yc3d7UjNiESUXEgXppL2Fx09osZSmUMJqXEsw6lM5NTKiWc6NjaFA=
X-Received: by 2002:a25:7902:0:b0:67b:d842:1184 with SMTP id
 u2-20020a257902000000b0067bd8421184mr7386841ybc.374.1661520312394; Fri, 26
 Aug 2022 06:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220823230753.14799-1-mario.limonciello@amd.com> <6ffb775a97384ff59676d9c4337481f0@AcuMS.aculab.com>
In-Reply-To: <6ffb775a97384ff59676d9c4337481f0@AcuMS.aculab.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 15:24:59 +0200
Message-ID: <CACRpkdZoX806ZbhHWptX6b3D-7p0Hsa6HXW5XsSj1Y2WFR3K7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Pick some different unicode symbols
To:     David Laight <David.Laight@aculab.com>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 24, 2022 at 3:51 PM David Laight <David.Laight@aculab.com> wrote:

> I hope I'm never the person you tries to write a test script
> to check the output....
> Or describe them to someone else...

I think these are the people doing those scripts at AMD.

> The best 'fix' is to remove all the stupid characters.

I let the people using the debugfs decide :P

Yours,
Linus Walleij
