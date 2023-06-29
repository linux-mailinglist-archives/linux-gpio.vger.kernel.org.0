Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81ABE742505
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jun 2023 13:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjF2Le0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jun 2023 07:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbjF2LeY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jun 2023 07:34:24 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BB330EF
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:34:22 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so2403565e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688038461; x=1690630461;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YULSmtbX9rlPZn3J3lVbckFoMbFcIcenouQqtwwpZ5I=;
        b=x+bTdowmIv7zubvx3AOEaDtGmxUEMkscOb+zyEQeoVh28DW2Qc2s0NvQyOWSg9aPZR
         h/G7z3f6rEl2xJNtzjYJykYsa+HYWTQiiOwRn4SI9OsYY4mrX51QPRcv2VxeYrzCPfV1
         z0xu8KnL7dHa0JL4e+j/a8N99mtqqYBuq985Xi7lm78hOvhpiZhhwSRalNoP7+lw9ImQ
         IxEHVHtR7Z9fiR8ch3zT8YiWh1O/I3YxhuzkvlsvEd7j17KPqRm6B/uQqmhns2QNOTnJ
         7slKyJY9Ul2jImf2Oanbm9CtMqVMs2kxoxobuP8txySZAfBAWC2T3iF8hZhua0SYYZIZ
         ulsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688038461; x=1690630461;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YULSmtbX9rlPZn3J3lVbckFoMbFcIcenouQqtwwpZ5I=;
        b=kKq8LrpTVtVGMW0P6wTmnZIUr37NmlFCNZ5JgPvdZKTXcvHss9zXo7bqpAujLC5JZU
         N7hKP/93u1XQ86N9rel68nBGYVlqIJQLBrdEyMnrsi5AVnG1plhCu+HRkqxLgxzS85Ek
         xUO0lCF6bHrKxoQBc58NceYe3llexcGphfFk8Cu+WotR7MywuRzU9H5LT+3LBssBkz0O
         ftNjxE9E6wi7YyskCozKwg7f6PWrWm8OcWQjzMSlxJpMpmfylb+IyFYyVu+Ki4Aszcd6
         6SnmPkM4e4PLD3bNgAbUltqMDL3ykZofe/3m+mWR20THWJatiKM+zbjT3XdiZzX+eoVj
         FTjQ==
X-Gm-Message-State: AC+VfDwmhnftrByTYjz50Gvt1XVulIhk563HVJPpZLPgnKTu0Or4KgTy
        09NzHxPVsmE2MGo8Bp9yTj9f151pO3EdBud2VVs=
X-Google-Smtp-Source: ACHHUZ6gJmKjKnVNJz4WhsFc5Q5whVWNL8xju822Wu9C4t60Sc1bMZkUSGxy+Dgc0+PXEmjqNqsDRQ==
X-Received: by 2002:a05:600c:2942:b0:3fb:bb28:dc3b with SMTP id n2-20020a05600c294200b003fbbb28dc3bmr1007472wmd.10.1688038460777;
        Thu, 29 Jun 2023 04:34:20 -0700 (PDT)
Received: from localhost (i5C7438BA.versanet.de. [92.116.56.186])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bcbd4000000b003fb739d27aesm8090453wmi.35.2023.06.29.04.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 04:34:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 29 Jun 2023 13:34:19 +0200
Message-Id: <CTP3OYVTMZOF.2XDV4PR553P0T@fedora>
Cc:     <brgl@bgdev.pl>
To:     "Kent Gibson" <warthog618@gmail.com>, <linux-gpio@vger.kernel.org>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] bindings: rust: fix unclear resolver
 warning
X-Mailer: aerc 0.14.0
References: <20230629101455.127795-1-warthog618@gmail.com>
 <20230629101455.127795-3-warthog618@gmail.com>
In-Reply-To: <20230629101455.127795-3-warthog618@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu Jun 29, 2023 at 12:14 PM CEST, Kent Gibson wrote:
> Fix the following warning:
>
> "some crates are on edition 2021 which defaults to `resolver =3D "2"`,
>  but virtual workspaces default to `resolver =3D "1"`"
>
> Clarify the resolver selection as the 2021 edition by setting the
> workspace.resolver to "2".

Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
