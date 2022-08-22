Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1360059BBF4
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 10:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbiHVIse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 04:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbiHVIsG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 04:48:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7782D1F7
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:48:05 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t5so12902766edc.11
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=h3DwVA8n548QEbk7xzEw0AGLDacCVtEZ5kVMh5yR+gk=;
        b=RkgY7LUSSBJV/BHTRGTUss/TrXa1Ddh7lS9OZzr0bnZu4FXsUEbjfpYnMaf948ki5C
         Q/K+4cIbN4hbUZpGTAc1m0VMNqFvB9DQXyuIV/Jr/HY7t6XVO6eTDAyE+yDsMzb1x7Oj
         7IMqh0akXOHO2tGxkA2Oni1nfmlvfFi0XTMg3b5MvH0Fr3c+EU/xavwMpV1PHmrlLBr2
         CvwKR/8sc6SZvz5Eo2Qy2PDyIGpJ9YVe32qeHnwUk4fAmbHxyohP4+aQ8RKY5idDJl9x
         EVm7QCNkRNFlmhjqZdAwCOUl5rykEmF1lwTMPOKhmLzJ42Nr/2ZoS107cVdxguylmagb
         UAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=h3DwVA8n548QEbk7xzEw0AGLDacCVtEZ5kVMh5yR+gk=;
        b=tmu909wuTAzPXd4ebJHkmCks2SzA2JZAKttYQweSZ8o49yHuAL3l8/Fa/S7HLJ0n/s
         WkGB2D88Y5gCuNkwb13c1/Upn+pRMYJwA5yYQBRBKGBEEEmcL+iKa83DuyGBeLrwxprr
         0SG/20t+9p7RiGn2NmdmzrXa6JZfG/CV8U0wccqrPH1rCT8+L2zZtFLRDKvQxxD6iv54
         c1CISBmrB5620Uxe2rWWujQ0dC42QmeuLWC664BRU1mnByRv6bm7rYJOmtnB1trD1RkM
         mvSrlSqWqjvf2RjfvH1KoC5/93vYh9MdLt7tGN4v2dY/0C3gVTzUCFNaPgbBjdVQe069
         XjZQ==
X-Gm-Message-State: ACgBeo3i/c62D247lBIbtX9KX5P4WtXEUpK86uco2s+GwtlAQa7YW/rT
        1WIRwIBs5CrbK23wIVoYLne9mFA3nCrhtTuj721Phg==
X-Google-Smtp-Source: AA6agR71Tzz3B/GKGKXJ7uKuLgoF7qBVW64wZcAoyLQ962MVw/2bZ8kLAeJ8501lZjeAN+BRBRrZ6Qspt2rtDoufE4U=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr15391455edb.133.1661158083586; Mon, 22
 Aug 2022 01:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220805122202.23174-1-pali@kernel.org>
In-Reply-To: <20220805122202.23174-1-pali@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 10:47:51 +0200
Message-ID: <CACRpkdZAv=_hnn_EPqn2FY_TVUzO0pmyruXqSYt+D_4SD-MKtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: armada-37xx: Add missing GPIO-only pins
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
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

On Fri, Aug 5, 2022 at 2:22 PM Pali Roh=C3=A1r <pali@kernel.org> wrote:

> gpio1_5 and gpio2_2 are GPIO-only pins. Add them into MPP groups table
> so they are properly exported as valid pin numbers.
>
> Fixes: 87466ccd9401 ("pinctrl: armada-37xx: Add pin controller support fo=
r Armada 37xx")
> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>

All 4 patches applied for next (v6.1), deemed as non-urgent fixes
also I guess the patches depend on each other, any other handling
desired: suggest.

Yours,
Linus Walleij
