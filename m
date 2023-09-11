Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6BA79BBC0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 02:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbjIKU4b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238188AbjIKNp7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 09:45:59 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF32CD7
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:45:55 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d7b91422da8so3894039276.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694439954; x=1695044754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abR3VaGNrRHsdwyHrrQpJiXZlzgarJ3lOwO59sLmP30=;
        b=Anr84nNaDf5SDUmlzcS3izOQDFwGyQGNlWpDSr1xnWSHrbXA83Zu9CIQCI0w0UQFl4
         TPNCyqZu0SApQUm/l5+p5g51P5ZdUEpAnxucTCTW9bZOpDgCYJIDBYibBlHf5+U3W8am
         Rh8+DH7QiAng+uM+fh/sglCGnUny/KA7Of2uZ3T4vzNYd8Z457qlXnuk33lzT+dgKF1C
         c4wktkWxhNR71HiBqpYLxO+LZuss+4fhLWqChetnLdVuDVfOR0Ldw+bIC6Bo6XxCZGtB
         Sqhe89lvozG3z6q9joXTJFeB5JBrKptDl52/oKQYCEm49DeVyFHdAWbNvLr3IyMErmIl
         oNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439954; x=1695044754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abR3VaGNrRHsdwyHrrQpJiXZlzgarJ3lOwO59sLmP30=;
        b=poqlY8KUT/72nMbcYsRzQ0fKS/sGsvaQ7GvluhPRtjQ1H2M1nlWL37Tc557VXLRBkU
         e6rtHJnXzkWt0yhn6clf4qyItpcPR3+ZXxKJZ2i94wBbOvK53CTrYAyfbKcMZZLkfu86
         7pLPDhp/yKl3Wr50SDo6MrazkhrlggtlktMlRX+0TXQ3WQKj3gvGHSDMoWbPVdXwzZae
         dv4x7MPRqXAaOF54xemLbad8ak2+akXpZ76Gxl3CeoXcr2zs9Zx7Z+jjU0xpcrv5v7gt
         3+9flKSUYQkV+QsOBTCHlgRJkFgUl3VUO5K+OSP+pPUp1c3fDfEUSuWVtBfb/2zr1q8a
         K1oQ==
X-Gm-Message-State: AOJu0YzZ1PacVi2VsNIGVaBGHs5GseqXH0qCHJrA7htc3Jecjkmpoyhc
        s4xy25r3vvohLwqB5XO7L+LqZ/P1BO8zDm3C1Y4bcg==
X-Google-Smtp-Source: AGHT+IHSmmS4us5sCBMBcWYUwI3gk4Nef2vfeWu7sD/aTdMDmtbPS37oafhhcEFKXl6M7fvbFEjCFVJosncHlPqhv+M=
X-Received: by 2002:a25:b11c:0:b0:d78:1f87:d6f1 with SMTP id
 g28-20020a25b11c000000b00d781f87d6f1mr8323772ybj.33.1694439954285; Mon, 11
 Sep 2023 06:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <0ff17be9b31c9fcf03481c0665293b98ced741f7.1692871243.git.geert+renesas@glider.be>
In-Reply-To: <0ff17be9b31c9fcf03481c0665293b98ced741f7.1692871243.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 15:45:43 +0200
Message-ID: <CACRpkdbS8XMuSrEVVcCGWpySnUjew+hRyX4S468iFRp0_g_U-Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: Drop superfluous ampersands
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jisheng Zhang <jszhang@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 24, 2023 at 12:05=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> There is no need to use an ampersand to take the address of a function.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied as nonurgent fix.

Yours,
Linus Walleij
