Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462587149CC
	for <lists+linux-gpio@lfdr.de>; Mon, 29 May 2023 15:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjE2NCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 May 2023 09:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjE2NCW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2023 09:02:22 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AB991
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:02:20 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-ba8374001abso4778533276.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2023 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685365340; x=1687957340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtEq7evxUqhjc3Wdsn1VBjLTOzYV8WO++w4Z6/YVbg8=;
        b=yIvMtb1rAP00uOtO+Q2ceFjO1ne60iBFL9sC2SUhkLOUWAYV78pI4POrha6z+tF0Tg
         DsHGMJZOU7E8uaWyRGMwpmQamXQGoU/Uj1VnDWtetXA6agkgFSFCQywtHUM1KBF2oKLp
         nJR56smmijD9N901SZ4L8QS0feFmIuf3olfoC2z7/I5krH1/UDWhBiAr7myG1JtqzgRu
         ESapcYvlHGGMV6v7oZcGCp9salgenadnh9C/jaW8jGx7ZW9QfDlEpBbYns2R4wERWCF7
         jyYeHrxylqaNU60hoAOqvEcdvPCmFPjB+BL7WXichzDhAUkXv/LNZ20UIjPxZktlSVI9
         HQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685365340; x=1687957340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtEq7evxUqhjc3Wdsn1VBjLTOzYV8WO++w4Z6/YVbg8=;
        b=Z7SgRZlAl9LgirYRUQkxcOL2opCz3SxGoDXsbPQtk5quCayqdcUij0X9bPMqklRIl/
         mgs6+S7jckVcfULlZlMdKMHZJJCoQh/vZQRVU6xvKkZUp8yYHqLsY23Np8xQsV52Huj3
         w5p/BPRNCLsysfoip+RWhkJ/PE6ZKj/mgTT9fCJwFkfsfOd3b9PIUn8eIGtQw+OStKOV
         I/W+BAf0ROqyRFWF8WEKpYDXPb/yf2KijdRCmW7eVcHYa9GJqecKyeJ/igbSMNf41er1
         q+z6UR0ugYHaoqjUJpXnZiuQ/jfWKAZuW3burQyL+BISuc2B2DC2Gb47XskJYIKa+YPT
         vzkQ==
X-Gm-Message-State: AC+VfDywCWJgzV06qod7eO6UEgN1eD61eMuykFG7+6Vez4MU9c6bQnOF
        nHmvXe949y0/llGGdsSRE+8pmjkrM6Bk0Qxw3NpDXw==
X-Google-Smtp-Source: ACHHUZ45qPWDCzdYrR83az10h+ocr8x2TvtUgtc0ZnAj/m63j5+urCFrvHOh42cdDjobaEg37F/yF3FaIuHAlp75/5M=
X-Received: by 2002:a25:1503:0:b0:ba7:54ab:d676 with SMTP id
 3-20020a251503000000b00ba754abd676mr10208416ybv.63.1685365340110; Mon, 29 May
 2023 06:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230529025011.2806-1-xingtong_wu@163.com> <20230529025011.2806-2-xingtong_wu@163.com>
In-Reply-To: <20230529025011.2806-2-xingtong_wu@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 May 2023 15:02:08 +0200
Message-ID: <CACRpkdaLyEmdhutqsMUoV3ObW8bFePtNGHFqr5qiKV3w0ripug@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio-f7188x: fix base values conflicts with other
 gpio pins
To:     xingtong_wu@163.com
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, henning.schild@siemens.com,
        xingtong.wu@siemens.com
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

On Mon, May 29, 2023 at 4:55=E2=80=AFAM <xingtong_wu@163.com> wrote:

> From: "xingtong.wu" <xingtong.wu@siemens.com>
>
> switch pin base from static to automatic allocation to
> avoid conflicts and align with other gpio chip drivers
>
> Signed-off-by: xingtong.wu <xingtong.wu@siemens.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If this platform does not have a ton of userspace using the obsolete
sysfs this should be fine to apply. I say let's apply and see what happens.

Yours,
Linus Walleij
