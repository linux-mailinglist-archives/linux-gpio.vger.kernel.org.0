Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 976CA79BC3A
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240369AbjIKU40 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238198AbjIKNsB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:48:01 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806BAF5
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:47:57 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d7f0048b042so3793041276.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694440076; x=1695044876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fp2twria2YbePMccZx/Qu0y72QIVLYKgrTH3il7drNE=;
        b=jbl/zttMy1rM95JEIKLzYmmKhSZVzUyeLkvHzSIAzudm2GTq2PGFT7i9dB2122ezvX
         CiKsQ+132OhWw+qmWvubwz/axQc6VCHmlc3AWsLXMzxIJjiaPNCQAtw4ZwfV9tNJIa7K
         +rcLCe+nvE1dGpnO8KDrQbZN+DcuirUe0oc5Gf1K6MQS0W+yDPJeCxrVeqJ6ZiI1DzwG
         8/ZYL3ZuJ/ac4px6/e+jSMUloQkPAmZe0OWP+2Ik5OXu+fHtHocM5YqklHAyc0cCyMz5
         edPCwKwGNMCzhPsyxOlp/JIFMdKBTwordLb+p7wKM2Mc2XkoKpC9kOWzFjZx/NomKmfv
         FG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694440076; x=1695044876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp2twria2YbePMccZx/Qu0y72QIVLYKgrTH3il7drNE=;
        b=r7vyHvYu3kyLryY1xH+AUkNYBLDgOrzNES+s+raXyFDyXrSCsycwF2yLJGnu+rCpn7
         81mRJmX+Ag4ewb52fnNZZ/VPI3+61ZOjXjRjXahhNQZ4a2/cNUUx9z1Ecsd5asp+fnrn
         EUYRo5FSmbWGPsHPWLVoaIqGLy1LKVXqN7McmeN4YjxSVielz+YQUVZ1Zc6YiXYKzva8
         D5+c1q5ina3ueDL2KVQWkYdWNSITttw1/jPNBRo0MlaK56MerhwYHQQR0My7x+DqXlSf
         nAkF4S3Nb7BxXdX5FA4s+YEROZA2ECL2ZrZUE1ZpnrkNzq6ciFpLv/N4GfbBaTxusMsa
         zyZQ==
X-Gm-Message-State: AOJu0YxIEG4eyJJpHmBwT+OlofSdmcBXWIr4dAh50PpytcDbIRW9TYs0
        caBEpvUq9GWQgjl65yp8Ky4TWy5rWb0s8Aj1HPzBUQ==
X-Google-Smtp-Source: AGHT+IHVt+3ZnchikFhFDRdBa/VQCJqjPO8/HkZfwGGvKceMtyovgD2bEwrTwVvQ8oiPu7q9EPztaRlWLDT5bTx7a5M=
X-Received: by 2002:a25:1342:0:b0:d64:6cd9:29a4 with SMTP id
 63-20020a251342000000b00d646cd929a4mr7430147ybt.61.1694440076690; Mon, 11 Sep
 2023 06:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
In-Reply-To: <81e9ab48f78d63153b23a163b3349b3059d2b7fc.1692871558.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:47:45 +0200
Message-ID: <CACRpkdYyBg3WKaTWy+xHmA4Bp-r0tWWNj8T+VrvST9h0oWeVOQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Use pinconf_generic_dt_node_to_map_all()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 12:07=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Use the pinconf_generic_dt_node_to_map_all() helper instead of
> open-coding the same operation, to avoid having to provide custom
> pinctrl_ops.dt_node_to_map() callbacks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied, I hope this doesn't disturb Tomers ongoing work
too much.

Yours,
Linus Walleij
