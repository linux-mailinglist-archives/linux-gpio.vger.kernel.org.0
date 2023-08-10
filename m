Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F564777542
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Aug 2023 12:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbjHJKB2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Aug 2023 06:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235212AbjHJKAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Aug 2023 06:00:46 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D053AA4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 02:59:55 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1bfc2b68090so598683fac.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Aug 2023 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691661594; x=1692266394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JGWiMZs7afpHNba/9KEQj3tEokgpEuSpBv4LeBPKa4=;
        b=Lm1JCMFGUbo0kBsVApqK1y00PydiuWA/U5/leDQ5VnC3BZPEcITpqhLwyrBdQsn+GR
         F+n+z+iRK1CGjqC4lVc0fVWXJP8OfQ4C0R9gGsBtWyfKtP1dqnrPn55I00ew6ERcmCD7
         q8j3DQwsBCTPSF26HTmQ3nc45eu1aANNNTzvouwftWY1PNpz2ob4yG87A2dyKjl9FYWZ
         8JlCB0tflDsBWH8xQJjuiV3Bdlfjo0c0k/mpxkosocc+o3n/GGGp1b8PLTb5GWTRdiRK
         hHjNA7nGh+lw/A1g5rrlMCEa89ZZjr7DTeOwa3tjp0wEuja+zRg8n6FsKbmzWOfI1FcE
         j19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691661594; x=1692266394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JGWiMZs7afpHNba/9KEQj3tEokgpEuSpBv4LeBPKa4=;
        b=KRbLbDXEStuxKw6SyW0xmI2vxQ10ldGdwEewpr+hIBSaP11XobsUe9N6w0xeEgmvPt
         YRri1JLtivzH+iVQwhuSCm0ak7pntkPBTyzmpPDhlh1t9Q/AfaeVMGzxg1UhBMfL4N8M
         5JxftvyGgilwPGHN3zI3uT3/IqjbOLw6Vw0JeoMzGmrwlQGFqQJMn8USDfUOSfJwAo/I
         1r5BHr4PP1kAwc8LDqfMmGr871ptzjMlkupS9zcicb4D4Zs41LLh1FkNuldH5nuuKMk4
         YYuPbi/o7OZ2JxDAn5Wr0zcecc3fODRQGX1hFUEoi+j1O+e600GnzRCx6h9mphmJ5MeW
         lgkQ==
X-Gm-Message-State: AOJu0Yw40/NVvcDUWrP/zcMcGwA5N+VnosIC+G1ARIA0ZUDjqStzofbr
        yG2Lkp5NlPiVZRK8MWoJU0/t+CPNTHzzIWdSofw=
X-Google-Smtp-Source: AGHT+IH3hMflAx0JByKHk0Nmor/tcbKdqITi4L9TTc3sTk8X0lRLX3LQYjMVL6z51ZZH6H72rreI4O38LghoYxXQCVs=
X-Received: by 2002:a05:6870:239e:b0:1be:f23f:99b with SMTP id
 e30-20020a056870239e00b001bef23f099bmr2289939oap.42.1691661594389; Thu, 10
 Aug 2023 02:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230809141324.400448-1-shenwei.wang@nxp.com>
In-Reply-To: <20230809141324.400448-1-shenwei.wang@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Aug 2023 12:59:18 +0300
Message-ID: <CAHp75VfB_fHD-h3Tdu=oB90Y7UC1RG2U3ECX4pymMCRFTux0Mg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: release the parent IRQ in runtime suspend
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 9, 2023 at 5:13=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
>
> Release the parent interrupt request during runtime suspend, allowing
> the parent interrupt controller to enter runtime suspend if there are
> no active users.
>
> This change may not have a visible impact if the parent controller is
> the GIC, but it can enable significant power savings for parent IRQ
> controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
> the parent IRQ provides an opportunity for the subsystem to enter suspend
> states if there are no active users.

Assumed that this change has been tested (esp. when an IRQ is wakeup
source), I'm fine with it,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
