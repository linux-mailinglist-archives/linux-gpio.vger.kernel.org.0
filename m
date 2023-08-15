Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754CD77CBFD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 13:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236844AbjHOLr6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 07:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236859AbjHOLq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 07:46:59 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285D21984
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:46:49 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d6d52f4f977so1434689276.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692100008; x=1692704808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWMgCRnZkuX6YpUNJlyFtpukcwpzyzuF5aeBLlwnJt8=;
        b=Bdmp+fECNv7SVFC3CdeH1+ianmn6/4OojROznxF2pp1imlGMLchyY31cjCMNfZWRLI
         RaaiPG2/TbMSDv6oNBlYpqWW+DjAQbUw8aAIRzdA+eJKFZ5fc+A8PhPRehMBXApfTnUo
         A6pX6Tc6enF2WgsPVN8fLbrFqiJX1e1WG1TXZ3t7bH1TkEB51I4PAv8mS7sk8vkHtwXL
         2EceHG9JCHJ1U3yGs20r7fyqBGO5HKXZZe9SbjxJjv6OTpnnjUsaI24twCkT/yP/z0+k
         5N6NPJOPNK8sjzTkU4EOBi94PNx37znleqe0pC0TBcvxLoS1zz18bT7xW26+b3ZUMBm9
         2myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100008; x=1692704808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWMgCRnZkuX6YpUNJlyFtpukcwpzyzuF5aeBLlwnJt8=;
        b=GHrOwASnKEfhH8NXNV08tfV6vtcrKkc6KlXgSaNjAGp8J4qCHOxqg/P4Qx7sh9MZKs
         kk2Ak4dpAUHpUbUe+epGkHxEUMhRAD8bA538TDuewXkJllPm+F0D8A6G2zr5S+x61+FT
         XE3pfvMeoFlGF3Y0iMbhZz4TKVLeZL6jbNZbXB1XLk+L2IkeOeyWJHIsRpPgmfyaocL1
         PqiNN0nXKD99NYrnOlKhjwD+nxsk5VpciHje+M9apq3Fyr5dnooTecwxSQKnXoFiYHpt
         TlbKJN1je/lCMw+CDAh4yi+C0+39ru8mnVOh+oaKrIhH+EOlkbg6Bbq5xSsoNNHVXjGn
         DylA==
X-Gm-Message-State: AOJu0YwEmHxK7D6dupmVkDOoU7i4kstwSF0d1/sN8+V30RpRxi1vwqqG
        KIBBLYFf8Qhf6XQzA79bLHEteSn8i8hQo4ZLbis9vg==
X-Google-Smtp-Source: AGHT+IHZUvPePMbjmE4Ehr0JCREkzKMDAVW96YzhFFE0c1lK+pTrManqxrD+fmG2nzFnspkMSH9tLe4sdSsE0L+WY9E=
X-Received: by 2002:a25:2495:0:b0:d47:3d16:4afc with SMTP id
 k143-20020a252495000000b00d473d164afcmr11962877ybk.22.1692100008418; Tue, 15
 Aug 2023 04:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230814072436.3757-1-biju.das.jz@bp.renesas.com>
 <20230814072436.3757-2-biju.das.jz@bp.renesas.com> <CACRpkdaZGrnV6bp0Sz5_yxG6y0oAqBeZh2UAz+pM4ULtpWq30Q@mail.gmail.com>
 <CAMuHMdU+544cr+Ykq9Z=0Q8YoNdwWyqHkN81v8UzJJXF23uQsw@mail.gmail.com>
In-Reply-To: <CAMuHMdU+544cr+Ykq9Z=0Q8YoNdwWyqHkN81v8UzJJXF23uQsw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 13:46:37 +0200
Message-ID: <CACRpkdb1yW=jckcwFcjwQzx7JcxBWOoea_FEbBtj=FFWUmL_8A@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer dereference
 in rzg2l_dt_subnode_to_map()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 15, 2023 at 11:32=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Aug 15, 2023 at 11:14=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> > On Mon, Aug 14, 2023 at 9:24=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > Fix the below random NULL pointer crash during boot by serializing
> > > pinctrl group and function creation/remove calls in
> > > rzg2l_dt_subnode_to_map() with mutex lock.
> >
> > What about using, hehe, scoped guards? Bartosz premiered the use
> > of this and I already like it a lot... see:
> > https://lore.kernel.org/linux-gpio/20230812183635.5478-1-brgl@bgdev.pl/
>
> Quoting the other Linus:
>
>    "We should probably also strive to avoid it for bug-fixes that end up
>     going to stable."
>
> https://lore.kernel.org/all/CAHk-=3Dwjsb5gZTvhXofPCQthk48S9_bSGohXKU8x8XD=
nf7=3DbROw@mail.gmail.com

Right, I missed it's an urgent fix :/

Let's put a mental note to sweep over the driver once this is done and
see if we can use scoped guards to avoid more problems in the future?

Yours,
Linus Walleij
