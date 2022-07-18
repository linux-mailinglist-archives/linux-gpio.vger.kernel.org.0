Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24D82577FB3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 12:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234293AbiGRKdS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 06:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbiGRKdR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 06:33:17 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6751DA42
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:33:16 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i206so20009744ybc.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nB9TysPxASoCZq2mAu9xXViPEOO/JgqPxrNGpKeDpVM=;
        b=SBJxEmiH2w/cKdGxjgxmO0ELCL2TKEVUhjnrHf02yQcDhryh8KhJbZjCQLKQGk++Nb
         8NRjbtRS5fTBMu89pQaD4QQbY4IVRizv3Z4O870kh6S7lm/ldRQVOx5W9p8dE8uF8+q1
         gqg2Jd/fcZQHcRLuT+wb0O8fOnapWzaZMH5Liowteg/RcA8gHe0WV07PEXwSCJIfgWxk
         +wdXGDMDIJl3sz5FhRUP/2eq2YXFFYNpj2G+9C20ZrxnjY+gLD7DuEhrz0BMKf+9Ere+
         RH3XBHlqCJ8O07Lxqjw0ivBFpU9k3qjHLX2kXgQIAzto68wevq5RblZGEO7+W3NA0+fV
         qOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nB9TysPxASoCZq2mAu9xXViPEOO/JgqPxrNGpKeDpVM=;
        b=S1ypzqV3U4FW4QXJn+J3DwMhAf7oWCF2TZ312jGvFIGXeFS0bTnJNEH53JWMVVnvee
         dXDLbZMIL8XeAFG12FbpP9ZZvsWOi+dt4jKkYrmdcji64yUSrhGWVzjTK+Gcfv/D5BHG
         JMfAzktfF/7EBnO6IdNM7/up/7dExq02rjP8eSCed+rMUm/pS/o/dyCRGk2rQ6m2Gq7h
         QF8ARaAj6GXAnUiTS3AwBrGq3+oRqtgZy+tIBXpM7g2r47oGjWb2LhLaSZU/OCEz9EyI
         5hgk+ShVBZI0Bq+4KtS1Cfu6QwufXVGUQt9vOeWwwc/LwC2kmXAapxadeuezdURbBPKs
         o7mg==
X-Gm-Message-State: AJIora+oYE/BqHeVH34nxMKlRbyNLxwHveSgGnm1AA0MAGLBbE6vhu3d
        2LCk7ZhxEjcwDGKOKJRME7X1QDokGJjuCMMDr/xMoQ==
X-Google-Smtp-Source: AGRyM1vLEixkZHCYiYRq5YltGu2Qn8XImkgcCPCgMkUAGgYU0xegYa5n58mUOA0/a3wp8LIkZmDox8dNhNHDnjcvtHM=
X-Received: by 2002:a25:8c91:0:b0:670:5c00:7c6a with SMTP id
 m17-20020a258c91000000b006705c007c6amr1433817ybl.66.1658140395744; Mon, 18
 Jul 2022 03:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220713131421.1527179-1-nuno.sa@analog.com> <20220713131421.1527179-5-nuno.sa@analog.com>
In-Reply-To: <20220713131421.1527179-5-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 12:33:04 +0200
Message-ID: <CACRpkdb7Sko3se4f8mYhyMxpr6rDYWO7_QnfizaHtBgLiVPFJA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: gpio: add pull-disable flag
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 3:13 PM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> This extends the flags that can be used in GPIO specifiers to indicate
> that no bias is intended in the pin.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
