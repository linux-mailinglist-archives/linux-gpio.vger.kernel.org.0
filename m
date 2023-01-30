Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413FC681E7E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 23:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjA3W5R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 17:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjA3W5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 17:57:17 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D075514E9F
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:57:15 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qw12so20646072ejc.2
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkBzjJq8dDnqIBZNW123DWc2O3D9KQjXbTdjR7yFFus=;
        b=iIx0SZmzpWvo5KBaBxIfrMUcfEcDuxJHpqslG3d0FdNksklMpfZ2YhatvG80tS8hLD
         K0Xttf+6ia++PzsgojAzPQKGehG1qXP8moNjRfnUu5vbdiI9bHHi4Ltz+tTuhHt41lZV
         8lApFJ24ir2c0M2fo4RxeUcIXsisL2UOZOTDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkBzjJq8dDnqIBZNW123DWc2O3D9KQjXbTdjR7yFFus=;
        b=6NEncLbshvrPI3WGO8XKCWTd0QYHI2Fv7MTzVY6GrFwrYee75mvKG5ebzcBLb6gTs5
         8WPfIu03UzueqDANx5cnHN7r/lsK7kGXUg09yynuG5m4ACzInw+k/cf3Ha2oObNGiBAX
         0uWrwHoY436J7LBU7dh5bDEnk9g34R+CAqFYcI9EbRL/vo24rZi83eD93QTdM44xkhX1
         PQOKw8B3Y4dRAwQRcB0xIcXnBq2UEjQGIeinptKEemUP/MJC09qzSlZOX8lhniOPe9KR
         9RxZyg8KJ29tU9UAkGWqWCN1FD+5MT/YxVjVTzZVtjL0/A1gq0DpplSWQjFHcCQw2wse
         yyhA==
X-Gm-Message-State: AO0yUKW0zYslEBHHSuWZp2y94hHuVGWnbxaq59bRVfoEfCNYeRN2JILv
        jQEr0EaSFxsPKF2n/vU0s6iFtN4EPJ0kLLy5LMnNG10h
X-Google-Smtp-Source: AK7set8n1Do8voL7vPuCqZxncXCif6aSlU8/Z208iQcQFG89jDC2Fvg/Ri4HhPN3QbgDwFlt4qdZkLSb8nXVLaaFx1Y=
X-Received: by 2002:a17:907:2a03:b0:87f:5802:fd72 with SMTP id
 fd3-20020a1709072a0300b0087f5802fd72mr2837501ejc.237.1675119434143; Mon, 30
 Jan 2023 14:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20230130220845.917985-1-joel@jms.id.au> <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
In-Reply-To: <CACRpkdY3VtkJZn4pHawFiW7yie+BWvT8o9Qx0Ym0ihgi3ACJ2A@mail.gmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 30 Jan 2023 22:57:01 +0000
Message-ID: <CACPK8XdCjpmx7rQoR2dBCovC6B60m-ovdn91jA7DpgOfp-LiyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Revert "Force to disable the function's signal"
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 30 Jan 2023 at 22:52, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jan 30, 2023 at 11:09 PM Joel Stanley <joel@jms.id.au> wrote:
>
> > For now, revert the offending patch while a correct solution is found.
> >
> > Fixes: cf517fef601b ("pinctrl: aspeed: Force to disable the function's signal")
> > Link: https://github.com/openbmc/linux/issues/218
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Patch applied for fixes, sorry for not getting around to reverting it
> myself, but the commit message got really nice in the meantime :)

:D

Thank you!
