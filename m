Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDD877C94F
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Aug 2023 10:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235597AbjHOIXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Aug 2023 04:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235613AbjHOIXp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Aug 2023 04:23:45 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0BDE72
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 01:23:44 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-56ca4d7079aso3610083eaf.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Aug 2023 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692087823; x=1692692623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+/qnY4s3O9rrWU/lJLgkQWAGmTXFaSBrM1nwh5H2Ug=;
        b=U62tym13etyd8Lv2775EVMPp1NUMkeDUd0VgFmZ//jYSNkmrldUQf16rwMjKEyS+Uh
         PuZVNU7eC71Xzt1HXBX8cKq4FELs1x5crxczWj7sw3HFjC2L6fjjVp6AUoLJEJor3Rr0
         ykgoBrShYla3Zk9ru2uq+TnA/8MhzfYN24gWxMqK4XJ/P04I40g4wWCh+/PpHVmGuCiR
         I8pV6qCfuDwnM3/gUDWmlm2tIsXdGcd+zDxKcbJ64faZhjl80zjJPQJOde4BTMtvNmdY
         qkDuCBSiZy1qoRSs/pVAglQnnQznJG4q11bMNgGgzWAsRScz5AlAE5KuLTXW2X9RFvQQ
         waaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692087823; x=1692692623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+/qnY4s3O9rrWU/lJLgkQWAGmTXFaSBrM1nwh5H2Ug=;
        b=hm7YyunhVRMp2AhdKOEvgaXOq+1Ts/liZgfCRN12vzIZhGhcTdzgLdjymW8MLxjyoV
         mceijCZxcpynYAc1LZsYxBdMpMKnQHHVw2D8uVoSUf0/n/ztyUYIqVWckxxWzBA19TLR
         oFLoYUNKys9fKpCUu9GBRRv+FTdLZj6j2JNVtDwu+H3jZzAV/EauPU81QfQtb4BNhK2R
         hEahbM4iNL5ScIrBNVD3UEU+djoGU+XojCqfltaws+XnVTh5nlVo6eDuVubAGEnhenVJ
         gihw6zyGj/OICHKLjsNwVFopTume9ze7JxVfPSoyvDfl0fUgCxxr5/Ffipb+e94wJvnW
         Oqng==
X-Gm-Message-State: AOJu0YysJpmULXWa7izHofSxG2MRmyiqFhcd86/bFYw2htadUijzOdNF
        EW7Ot1fuoShYgdrXTwW2vy1DZTfGD22vVLtlukgWkw==
X-Google-Smtp-Source: AGHT+IHZe2JYf6h5xBkiktmDAAJ7mhgcLZVHcUkqOn4jYmb7vvvl8cefNEhX0u+yeQzyD87YDK5qRQYxMv0CgZbbySc=
X-Received: by 2002:a05:6358:e49a:b0:13a:9d5:356a with SMTP id
 by26-20020a056358e49a00b0013a09d5356amr12170871rwb.21.1692087823463; Tue, 15
 Aug 2023 01:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <ZMZ3aEnrrZRDNdO+@standask-GA-A55M-S2HP>
In-Reply-To: <ZMZ3aEnrrZRDNdO+@standask-GA-A55M-S2HP>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Aug 2023 10:23:31 +0200
Message-ID: <CACRpkdaS_Lq6VGqv2mfSDw03H71XGc9HKAYsgEqkxaakKKxxjg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: brcm,bcm11351-pinctrl: Convert to YAML
To:     Stanislav Jakubek <stano.jakubek@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
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

On Sun, Jul 30, 2023 at 4:44=E2=80=AFPM Stanislav Jakubek
<stano.jakubek@gmail.com> wrote:

> Convert Broadcom BCM281xx pin controller bindings to DT schema.
>
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Patch applied!
Thanks for doing this Stanislav!

Yours,
Linus Walleij
