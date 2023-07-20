Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6080075B7ED
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 21:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGTTZq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 15:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjGTTZp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 15:25:45 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6652F1724
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:25:44 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b9b427b4fcso939756a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 12:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689881143; x=1690485943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAQyrdEhvsiS2R1Xx2rcZGY3e8qP6qEuY1+LKv5tz+A=;
        b=ehA/kC0QSIFAeXHxRnlSfa6uGMtT3D9qXfjnwMdBvSmQciW1wwWutz6XfUTP1RXWY6
         7IIzIGJ3l/gFqQO2WTI0Ek0NVNzIOuLYp2iPlKGgVUm9YrpE02gpnIp8QZXgroC6RMz2
         QpNrdjic08cKSDPWbc1Ei7mJLl1COpzyv99ANmoj78MFHLzXfUv6DxD4beS69IC+raUf
         ID/Y2LO28HS3iJns9WDOXW7Nj2URTmVD0IFNK/e65rH4z/i5QSCUPTvouCrSH/Lcc7nK
         k9hOuuY3IqUjRucrLSRIA4wOPdWe1giSUKTw4Y84kH0yrRxxN+e+qQ8X4l+JG0X/wQKz
         iCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689881143; x=1690485943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAQyrdEhvsiS2R1Xx2rcZGY3e8qP6qEuY1+LKv5tz+A=;
        b=N1Ly1FS2l3bwEm3AJminnSVN4miImAs+Lsf/OUU8t6t43oKPYqh/gUvoMgtDVqQJZ2
         Lx06NfEIqQRd6HeQ25R9NYZmjJ/J7d174IjqhYs/kMifoJFTHR4PyPRMdxt6m/bOhJW7
         Mt/qBAQbrR1ts5ETsYtfc97M+n7WjGQUcWNIq8Kf6rV2u1A2frdYv61bUbLWcqyEYbI4
         af1s/G1ebfpX8Ec8XK1sA17WzCwh/+jKt4JJVuBCu37+SHMme3abZ3YK8z508pXg4rsa
         YVMPkSya4YpndpW0pCKSQK2gFYvSTNLpegaNgGJOPRl2oGvi8d+cxiIGuvKuD+xhT6zs
         rLIA==
X-Gm-Message-State: ABy/qLZ6tUZxmfYgP+LDP6QgCyLU6Dl6r2Y9fAk/5lOYaNX8fyv0gvln
        +Q0K4FgiUL3z7+t9RKfPAI5lC0xvoKl1lpy35MDbCQ==
X-Google-Smtp-Source: APBJJlHrl322zhUTS4E8ekDobmG3vr4lmJX7pcYJyess5H8vaWCHscXLoY9qJztZNFzfwLbcuw66YlSe2go8Rn5W+Sg=
X-Received: by 2002:a05:6830:1e81:b0:6b9:b8fe:bf46 with SMTP id
 n1-20020a0568301e8100b006b9b8febf46mr4003118otr.38.1689881143774; Thu, 20 Jul
 2023 12:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230712022250.2319557-1-colin.foster@in-advantage.com> <20230712022250.2319557-2-colin.foster@in-advantage.com>
In-Reply-To: <20230712022250.2319557-2-colin.foster@in-advantage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:25:32 +0200
Message-ID: <CACRpkdYXeGq2LnD+bpAXm82Aa-Czob8afQSfjfMFweBLhdr9uw@mail.gmail.com>
Subject: Re: [RFC RESEND v1 pinctrl-next 1/1] pinctrl: microchip-sgpio: add
 activity and blink functionality
To:     Colin Foster <colin.foster@in-advantage.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        UNGLinuxDriver@microchip.com,
        Daniel Machon <daniel.machon@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2023 at 4:23=E2=80=AFAM Colin Foster
<colin.foster@in-advantage.com> wrote:

> Add additional functions - two blink and two activity, for each SGPIO
> output.
>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Could Lars or Horatiu review this patch? You guys know the driver
best.

Yours,
Linus Walleij
