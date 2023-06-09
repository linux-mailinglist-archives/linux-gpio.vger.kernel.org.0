Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2672E729074
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 08:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjFIG5X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 02:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238660AbjFIG5G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 02:57:06 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBAB3A96
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 23:56:59 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so3730163276.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686293818; x=1688885818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPnqXMOZVL6sTkCADxUPTqWs/TKz+PEnmIF/0BFjH8Q=;
        b=mzFSM/gnMPcPABMe+P7vONS3ZNBzFZ9yP/J/Kr8qWjXAfWXj9lFRm4Yq5/znbHMaWX
         xa4OS/lQHkFrz2nfYSXYiYy3orqqgjwZKo5yrQXNxWb73VSA5KzWr+QN1yf4Kq1ghL/J
         9Ccjx9032BjHefkUrpu6AZrB5c3oKZX04WJs+3IDQYMldxlmefymp3XWso0HIvfnRkvA
         JM2W9KMPJzbH9r7LPO0+vj+3i4N1F5IXtIDzl0LJ2fI3VES6vCs964litPxtkO4+S5aB
         KMxYJRmNiIiUJipGFNW3tfV+VYH93p2PzrqIvxzh0OO9Wo6GlXn3Oi+pJ1JLC9zZQBIK
         CIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686293818; x=1688885818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPnqXMOZVL6sTkCADxUPTqWs/TKz+PEnmIF/0BFjH8Q=;
        b=Zw0huLoD1EH2MJ/x7X4b6v7h+yfIH2W83KwVblqTkB3QcmqIbKCz/aNTSK87AXJ3d7
         LkujE57Dn+WR0JjE1cWjLyhukesc3znNHLw5cwLNceLa8xgjdTS1BF556WDWxXmMBoPV
         qrRwJ1YaL1vVIm4AarvrsZNY7pBQjwjFwQ7jKgPpDYKDjHdQjx9ttrZdQ3fq1ng9peO0
         8pmZwRjvMTdQ0bonVReUhHlOvJ+OgnvvtAWEtdhTqCAbR8qkOl52I/T1EaqffIVWFxW2
         b3j47ZdrQaw1+MthHoPz3zJeKQqG9M2pPxUqpMCiqEbfnf4siUyBATcVNeuKMNbhQyZD
         Tkcw==
X-Gm-Message-State: AC+VfDwS/Bt63n5lzhHJceqKSx4TY5JkwCqaTDYdddAETbZmIearqY7n
        7yKzFi/D5itj8xAcp3PTkvPJJKDbKaf8+zDgw54PPXgS7C2PWUj+
X-Google-Smtp-Source: ACHHUZ5X127VTzj4zOV1xeRhWkNtYt3iBIPKSBWOTbrgngPPTDrQ5epKwgsmZoP+K3u1v9n+9tto9vaqGSEX4/wb7mQ=
X-Received: by 2002:a25:54f:0:b0:bac:46f2:8d0f with SMTP id
 76-20020a25054f000000b00bac46f28d0fmr2700548ybf.3.1686293818393; Thu, 08 Jun
 2023 23:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230601173831.982429-1-nm@ti.com>
In-Reply-To: <20230601173831.982429-1-nm@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 08:56:47 +0200
Message-ID: <CACRpkdawgFtSt3wEGz5MC9apFiLgUbta4TRc6YhOrEGbT6Okvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop k3
To:     Nishanth Menon <nm@ti.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 1, 2023 at 7:38=E2=80=AFPM Nishanth Menon <nm@ti.com> wrote:

> If you could pick this up for the next 6.5 kernel window now that we have=
 kept the
> old header around for one cycle.

Patch applied!

Yours,
Linus Walleij
