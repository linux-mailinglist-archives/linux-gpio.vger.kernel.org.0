Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F3D6AC1D7
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 14:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbjCFNvO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 08:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjCFNvN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 08:51:13 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7095524137
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 05:50:52 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id n18so8116261ybm.10
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qtBLJgimyjUZrCTww2/nWMue86SQPNFkXsRzufY3H1M=;
        b=nc9A9BUpW53D5PqzzSiCD8QKIAcg5XrB2jR86Oy0dZxkV4hhjo5VfvM2uduB61dLDj
         g1SWXSUkXv8D8/jIa0Tafirdeu18wsaUUswPJgyWhU6GsO93pQgfnAnD/rB+IwPzhgeC
         JwkneIEmHW06XTirUjlEhyQrl+SL1XhlkX8/Yhad7MsPn2T9W2bbozKPGCRugTkPUjR3
         84KyRdnWPXCnLw2rTL6UAIKarmZ01/1pruEe3yXmsVmrbUAP468DhAVef1Ie/9PblIiz
         4EepnkIsybOmCNCc8g8kg1hRc6/2uKnlTnZ+aMC0pBc5JnR7kN1LVV1dBWB9jM1FqU58
         txLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtBLJgimyjUZrCTww2/nWMue86SQPNFkXsRzufY3H1M=;
        b=a6CHD86vIUAmDXrW+LB7fAYq9RuWg04EsSD4HgxbKF/EmQ5R4um+a6tpPoRCB4m5Eu
         vhJxGRB710qcjTqdddK9+7ORMq3fng8c2HA6NXBJ6rby6pUGzao2++/yCCraTnBSdJ5F
         24Tn+QZF7WCKCIMymQ8dIY9nrBgEGtkD+GSSLsMkbsEcTZ32Me+LPy2bN9Q15TOLLFMJ
         /+WYcKuevuzGeYUqvrcsmThq/V0h1zsIdiGuSk1ruo1ljyeS1DznCCJxdwhHUwqvIUmI
         n00tKzfGaCamIbMhnQm+zfEKQ26xDZcOcKponhrqXqlmWjUY0678zXmjgM3JI0z1g3EH
         wTTg==
X-Gm-Message-State: AO0yUKW0LiU69eGZ+w6uI+Sdzdt+nD9Wpvwl3Vs0l755MkV+dUsccbzO
        tDT+ElqjchEymmvfPWlITCUlBLpo2qCQpAnRjhh4+A==
X-Google-Smtp-Source: AK7set8JTNHF8MypTSPIeonQB8cYtk4+/oxJ7RhvaeapmVYTL7Epb5DAM67FQFkpGywXUdj7a90T61UM6PiJJ3f86BU=
X-Received: by 2002:a5b:384:0:b0:a65:8cd3:fc4 with SMTP id k4-20020a5b0384000000b00a658cd30fc4mr6353160ybp.5.1678110651682;
 Mon, 06 Mar 2023 05:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Mar 2023 14:50:40 +0100
Message-ID: <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
Subject: Re: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to
 mediatek, improve dt-bindings
To:     arinc9.unal@gmail.com
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        William Dean <williamsukatube@gmail.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Daniel Santos <daniel.santos@pobox.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Frank Wunderlich <frank-w@public-files.de>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:

> [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
>
> This is an ambitious effort I've been wanting to do for months.

Good with ambitions :)

As long as Sergio is on board and can test the changes and as long
as the DT maintainers do not explicitly disapprove, I'm game to merge
this.

I guess you will respin on top of v6.3-rc1 when the first round of
non-RFC feedback is collected.

Yours,
Linus Walleij
