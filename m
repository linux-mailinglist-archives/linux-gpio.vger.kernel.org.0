Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9C56D1CDB
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Mar 2023 11:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjCaJpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Mar 2023 05:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjCaJpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Mar 2023 05:45:19 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBE791EA2F
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 02:44:59 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j7so26748258ybg.4
        for <linux-gpio@vger.kernel.org>; Fri, 31 Mar 2023 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680255897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFoBmfNqHjVUcBGo6LT4gCtlcOPW6X249sn66zd7REI=;
        b=D+oxq2KU1R74cGVr861BWJ4QrYAsrmLr+vmkeT1ql1/boMG+f6uoZEDawa/VKwCjYz
         HvwZzsRFmuXcOQ7OC8ZkrQ4qk4hgX7XjTdMSMKhxLQP5dhkUSv0+BjA4azIUsD7DVVnJ
         +HjeE+U3DHlQ02wAVZ79Ncd9t+P0nwhV+zny21ktOo831mW8ue4iiDtUzYI79Y63zDt/
         NTCjCCoL6PPJYNpPYtiQyVmdbYqluh/TmbLGyu/+wjPt7v08hlqS97NNhA1txC7+/AfT
         X5XrVT7y55yqv3h/IFHvR096JbrsKLSUZzEuyTsYs2TB/ye5AhbxSKHhKnMYLgW8oBBu
         7UGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFoBmfNqHjVUcBGo6LT4gCtlcOPW6X249sn66zd7REI=;
        b=nbiVxaI0DKxTfF+ZQsRFe1jVzdqHP9xk6rbk5NMnr5KmEG2HbQTIA3gWu8vumgV9w3
         3nHXtYF6PMEo7Wx6yONgE4t8lf9tigQ9kE/Y5ztfc/PKM8GAnrm8rHpHdUR7d1toqkvZ
         8KhIeeDcinsqUL6teTpflF+F2eqZ7W/guq7d5nqjLkJFd9Wm/c+cuPLd1fSeUh18JalE
         v49JEvFn2KXi6jmB3d0jQmE7tv0gnkAfMIaYFcHlLYC1TwtR5ylJr6DFQmLrVg78xUZe
         ZKk0jlCFPopeR3AHxfAA/QHlKxbho9u1mE7F567YtMzvemXNotlxfZbyztPFMXXYK3Un
         MrJA==
X-Gm-Message-State: AAQBX9emE5PtNXP/H3cdsiaLp9OMOB2RZOItNdkkyHXo9vuuJmNtgs81
        ob3sua7KgqBQriRp2mdSAeABQboHVu9VB5X/wbTItw==
X-Google-Smtp-Source: AKy350aHm6mLdtXGnTgyPrVMJQyQC3lO6u+Ulkrj5iYb8yUd6TNae9hB7514yNzZeA9xapKc5n1SnbXnGp1OcanVf4c=
X-Received: by 2002:a05:6902:70f:b0:b75:8ac3:d5d2 with SMTP id
 k15-20020a056902070f00b00b758ac3d5d2mr17975062ybt.4.1680255897160; Fri, 31
 Mar 2023 02:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230328061257.1984972-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230328061257.1984972-1-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Mar 2023 11:44:46 +0200
Message-ID: <CACRpkdaM6U9T=mnuPO6MufGDRiBGzCAe8YkF2LrY_YXhfwxTLg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: fsl-imx-gpio: add i.MX8QM compatible
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, stefan@agner.ch, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
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

On Tue, Mar 28, 2023 at 8:07=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Add i.MX8QM compatible, same as i.MX8QXP.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
