Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D532720798
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 18:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjFBQb2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jun 2023 12:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236634AbjFBQbX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2023 12:31:23 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97833D3
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jun 2023 09:31:21 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-43b2da5b307so184011137.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2023 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685723480; x=1688315480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+hBKKXPJIQ7KD2o8aHmoI2vaz/azS57mWdmjYjZR80=;
        b=V7ZEpsi+bmtyIo3/hdMx0JG7gf+MGzTtIdShdhdRNC97CLwyW9swwcwEaaNsi0E2NE
         TY7QhY1L/tOKQkTZrZQfPS7wsT/sFU5vIKC615veUPFwVYeX7QgWCDu/qqCqkiJX+Gtl
         JAPdqtTJ/8AI92lkRhzr+oDKzqc80TjBHu+Mgx9SYiEW7KHIZcvJ1HdS7Lc9hCtHqjR6
         Po3oZ3QlQzG29c1jmJq+48cZpF7Rz15zX4IbzRntZqiSPALfzE7qNVSOlYxzXiXnxidL
         qPLO6y64NYiuknHDZUONHxVZ0l/YKHrMF4g8eUbtVoo3eL9IIoB3oYMdNuw71ngL8j4J
         cEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685723480; x=1688315480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+hBKKXPJIQ7KD2o8aHmoI2vaz/azS57mWdmjYjZR80=;
        b=heqpCCrMuRMAyKb1hyWcAcVsfz0cZzd1JfxNObzcdgu2hjWHjn8kFl7Y9wL+swdSdm
         o3YV3q17HeJuGCacwuQVqwjgIIufUXRAhZ5OxM3uFLxJ5YvMNmg9coGEqE29iZvGDcyt
         dGLlWCWJlZ4NaQUYYdSWWHhPxAzaEc/oaOgoOLGtM0PNuVQKWFoHZ/3XuqGUCEkJMQaq
         TBM7YRgbVCgsbKNWqZ3v6/2268MxUGjeIFwxHBZl1sZLNiy9Mr3KqRYjT28AJNgl4l9D
         +H8YLofj04QBnpaCaZcj7r2IlVSVtMgmVgdAsTlH1hNyA5Ac7p8FgL52u/9j6K100BqZ
         +vcg==
X-Gm-Message-State: AC+VfDxc5Zu3mK7IpPBaDLErwlY00VtoogEOhA77PL3aQvhdK8V43lmf
        NW5IkNAcU/4T+8DbzbDvo5GwzHxqmfZQ4djcIqN7Iw==
X-Google-Smtp-Source: ACHHUZ5j6iSilkvFPI04IvixuTs2dJB4i3Tx+YVuCyVF8E/2E8FOilNZhLSU3tIfWlaXbdl17w9SFrA1w883yke1K3A=
X-Received: by 2002:a67:ea1a:0:b0:436:3474:6ce4 with SMTP id
 g26-20020a67ea1a000000b0043634746ce4mr5540586vso.7.1685723480757; Fri, 02 Jun
 2023 09:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com> <20230406093344.917259-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230406093344.917259-3-alexander.stein@ew.tq-group.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Jun 2023 18:31:10 +0200
Message-ID: <CAMRc=MdfX4UxChLPNvT-SGraCfCSHEQpa_1cDm6vHwOoDntc_g@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: Add gpio delay driver
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 6, 2023 at 11:33=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This driver implements a GPIO enable/disable delay. It supports a list
> of GPIO outputs, which ramp-up/ramp-down delay can be specified at
> consumer location.
> The main purpose is to address external, passive delays upon line
> voltage changes.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
