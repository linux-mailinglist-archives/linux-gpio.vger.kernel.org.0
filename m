Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD0177F7E2
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 15:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351503AbjHQNil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 09:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351401AbjHQNiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 09:38:21 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7A726BC
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 06:38:19 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d63c0a6568fso7314405276.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692279499; x=1692884299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qKWZPFAAsStXWACO6WOH5ukjYungPgM0Dk+R3jEeS0=;
        b=fJ6Ax0IWCQx9DUCsoTVwu5/oM+5UPGFX0viiFdI2mdVEFYEDM0aArTXN7Tj00f/diI
         KO9+FwxzcgSaz++c6ebiG0r106mGaNdj+JRGy0V7AGRasR8upG1eNm2ey0SyWdwZpsdF
         Ef1el85gNmNilphNIYWllBnalDR9p6J5j7UqunlsR3VmWvsuJX6lZ1+kovvl+W6rCi6k
         idwi+Xq45dlRpUgviVNa1XtGMvzN785mKUAERzffFLMzO1lhRK95Eu27uE6vyCyvt+xB
         YGbVMQnXpHB9Tg3q5QlH7BTjabyKL5bmHNxWQkfWzc2nHKlea4zuhfdFnTILFM+ZL8oj
         ci8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279499; x=1692884299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qKWZPFAAsStXWACO6WOH5ukjYungPgM0Dk+R3jEeS0=;
        b=lHCZ5cISIQbvp2adxceIkb161TyNDA69uF1+KKHganZ4j4uS1fMElswADlYjmExSZ3
         9aYFKtG+obD8WQgp+zj1fwLCHXCvRC4s33jXjBGElNQPMZekOteaQ1Sxah36dNCZRDqO
         qjTC65j8goitVpyA0tjf591akc2zohcYwbIkhcoykuO2gQ0BwbIZpWWB4PL5VIWjaNMq
         bpW2D0AmaU5fYkNJYGl7f5T/zVD7IU+dmrsk+fWPE/eE1wWg92r/RPM1Og8migm9RnjD
         0vWbFPOch5JDYricxb+6N+BV7CuZAdZUX+EBqwf39X/hVoO6Bo8Tf6v6Qdj6KENVVftF
         UrKQ==
X-Gm-Message-State: AOJu0YwxulBIVlwxw3hh6oOJUwlLbkTfCQO1AFLvrj18jPojzjiewKX/
        BhLJhTinAzSi8y7raca3eDHINzj2bHqFXQskOgc4Fw==
X-Google-Smtp-Source: AGHT+IEJKbg8ErIPBz++ltc8FVwfo1bskOxzZCzdplvTs194HgQG+SM7A6CuJCMSyQACezD54qxmM5+EhwyBKJuK3UI=
X-Received: by 2002:a25:b185:0:b0:d53:f8e6:8447 with SMTP id
 h5-20020a25b185000000b00d53f8e68447mr5158713ybj.15.1692279498338; Thu, 17 Aug
 2023 06:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com>
 <20230815131558.33787-2-biju.das.jz@bp.renesas.com> <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
In-Reply-To: <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Aug 2023 15:38:06 +0200
Message-ID: <CACRpkdbWT333HNgSc0HMUvgDBkJdEvb23ZSHsQd-yfCOu3N=Ng@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
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

On Thu, Aug 17, 2023 at 2:44=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> need protection by a lock.  If no one objects, I will back out that
> change myself, queue this patch in renesas-pinctrl-for-v6.6, and send
> a PR tomorrow.

Shouldn't this even go in for v6.5?
Or is it non-urgent?

(Maybe I already asked, I have teflon-memory.)

Yours,
Linus Walleij
