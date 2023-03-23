Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2E916C6202
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Mar 2023 09:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjCWIj5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Mar 2023 04:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbjCWIj3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2023 04:39:29 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D264A168BF
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y5so23912615ybu.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=QE23HGJQHnGAd09QtB+TQS3Q2R0AzQuCJycDS0LJ3CvnhtMzqkExBmjQuj/DUSULwW
         CdTUyRpJfr0BxLeiqJk77HGiEpcXePcfNRVwAuvI4fjDQMcfKVbD5YDefCwoepOjxwZs
         CRKobbEslFR4+47TabRND3zS6BWHhNJQPmXbEQsdpKGm0+ZIf0RjTtSzFo1V0GM4z8iO
         t8YpWg2zcFpkTKc8apwndzQ5TnHNOY/z+enoDLOK1JvEzONxhz0ECaTqBZ98ytvb76mU
         C7s7uOR2SKQANO394Ed6N34I7/1N8dPGan68/QCltgPt0qY65XouFSoJLketbqzkmIx8
         o4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=X9YisbI98EC0TjpcaEGuzbJ3k0BQL5lv60jmOMQVT5KA2UgbQ+axJz2+pzOvWV1zBJ
         im//Z6T5ZL71boZ1SFnTgQOPuLy5qisjbwRcx4k5UXtPifak2qSEX1HOehV2qjucqMlx
         y4VrdB344BeYRDXQ80NKG2myxO2FSklpqsK5seDFtDW1dS7p2aWjCVYl8WjkLYBhC+nF
         x6wAaAadrWRjcJpllCfooq/ImYJzglXV51PnKRJlrBZnAe5McTnubAy8eH3qgOdcCvKr
         pL0vdEVpPjM8tMvuWxX2t9G36vw1DxlWNNQuUEcuP+IrY8Rpn4IyAoSNYddessC2+L2h
         /4Zw==
X-Gm-Message-State: AAQBX9fgMu+Bn+SbQZiOzFeYlQVqU8qLmEpastXHqeEu5YYlzRUkp5jD
        HIIkPHuZi2my8GtJ4xfev+TbCNM58tRNr9jHcHFoZg==
X-Google-Smtp-Source: AKy350Y1PGIFybckLNdnrmn7B3+z+PO42zpuO3LlrftnXKkUHf5Mxe7g7DsahcR71Hcc5jkg0FrjjJg/mpuCBsLCn1U=
X-Received: by 2002:a05:6902:124a:b0:b74:77fa:581d with SMTP id
 t10-20020a056902124a00b00b7477fa581dmr1459338ybu.4.1679560683403; Thu, 23 Mar
 2023 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-10-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:37:52 +0100
Message-ID: <CACRpkda9A-1qKqUPMC=9JKN5uotUmTt2CGQZv5Z91wgrSmwtHw@mail.gmail.com>
Subject: Re: [PATCH V4 09/10] hte: handle nvidia,gpio-controller property
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> The dt binding adds nvidia,gpio-controller property from Tegra234 SoC
> onwards to simplify code handling gpio chip search. The gpio chip search
> is needed for the AON GPIO GTE instances to map the hardware timestamp
> GPIO request (coming from the GPIO framework) to the tegra HTE
> providers. The patch also adds new gpio chip match function to match
> from the fwnode instead of the gpio controller label. The addition
> of the property does not break ABI for the existing Tegra194 code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Yups just like this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
