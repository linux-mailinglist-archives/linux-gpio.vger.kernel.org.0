Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657DB73203A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 20:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjFOS4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 14:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjFOS4l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 14:56:41 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11FF1715
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 11:56:40 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bd744ffc263so2123931276.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 11:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686855400; x=1689447400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh1mcfa2eNN5SjrefG1vsodp3cU0XsubxmfVk9IJM38=;
        b=vysnJKPok+T+fLiWW33G8ZN86FL/3r0qONJoAhVmRbYAx0IZV4Q8qcJs9ybck6trT6
         KcPhRW69laEd8/KwlfhndD9eXtbZ6yEDLM2rOcNUYlTFY9OfFxaxdiVEquFLW/ubpRkR
         G21lYSGUaiJ1MbC4cydSP/ZKVH5NGHVrfldjNvnfH9H+a+glWMa1RU1nEIpAEFs2qBnu
         k9t+VupzBPkhmCx5VZhO1Nm1UlqJFKkzpNSlMlY62eIAMoZ+tZ9oQHahBgXo/ldOkzKg
         aKQAQu2Qh1hc81FVKVVdP1I/kwPYNXaMMq7+XkZc+LPm3PVoRZgyjoh4ERzioiKVskFe
         ba1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686855400; x=1689447400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh1mcfa2eNN5SjrefG1vsodp3cU0XsubxmfVk9IJM38=;
        b=khPXdR6x1GKeOCm7rZCI5gh3FKmq+TMnNAJl746IK4VVns2BSKRDQTpuyz+HLnbUgI
         fQEsATsgEv8LJDWcyMBL/WVs8B+1KbvJRn/gzuuCE2EfoNcWMXDNXY2gn7r0cn3gvpX9
         B5bP79DOBCPLabeaLERPw4ZH9o9p03rbzbhcNa9/xEEQq8i4vZia8VZjAuwJ70tFHVEA
         PBwVXFa2l53hvsX3Sk5+YwFqH4kPzTkzzHFNCBsUOAwAo+Vv1ZV6BBmsYET3IKXPo6wJ
         sGnv6w2BMVANVn6GynUSD9cpqTJgkZNChnqPTWG8g5rFEslH+H9DTX1hxj7JtsXhaZr9
         Ai9A==
X-Gm-Message-State: AC+VfDyZ47+YAt6+m31zHa4vwRtkcQAocozUDnDW41WuaiOwpPZBYnuG
        kKldWUtkGaBEEAUmhWRI6xok5F4tqjRlAYU0DKUmzsFTHyD2ZhNv
X-Google-Smtp-Source: ACHHUZ5WlCgYAs7U7N/dDJh38xmycuMHAjg9f7x0CVWqROIg/MFOWWnXrYt2zw1mQUiTZunUGrwCXGuAKROqhT5dzhk=
X-Received: by 2002:a25:40ce:0:b0:ba9:b3dd:6b0d with SMTP id
 n197-20020a2540ce000000b00ba9b3dd6b0dmr5621461yba.64.1686855400038; Thu, 15
 Jun 2023 11:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230615162519.21244-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615162519.21244-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 20:56:29 +0200
Message-ID: <CACRpkdbJV9dh30ArNy40cO8aPTaZOe7TnO7q6jbXysFMkOJYwA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: lpc18xx: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>
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

On Thu, Jun 15, 2023 at 6:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is not and shouldn't be used in the GPIO drivers.
> Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
