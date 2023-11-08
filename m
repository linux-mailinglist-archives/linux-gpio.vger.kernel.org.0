Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4717B7E57BD
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 14:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233967AbjKHNGr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 08:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234691AbjKHNGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 08:06:46 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8026B1BF4
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 05:06:44 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-495eb6e2b80so2395389e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 05:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1699448803; x=1700053603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5P3aRrgT9D4tq8kw05rUVF1XE05nj8vTgSD+7tfGIio=;
        b=wXNc6vjdiJq0lG6lHeMBujesXmjdzW67Oq3xxow2tCirhP6n7TMzuzixNa5YU+EjRC
         koxb9vIBr5jC/hLBb7j9Bae4+oY1588kOYkpM4b5z49t+st9grdGPHeG2pa6LXO7bsyf
         GpMhcYsK4tC1nB4c/1ZZsuUAVY6nQwqOjIL80xHZlgjWPLgnh8yknZ4SdkxUBJKEru+a
         OJisK9DUG7z2BpxfADj7n1wjUVFjo/KxwoigKKSwmUW0NtyMlC9ajxaq5BYKamMhRM3/
         QQUnuuK0UOqrfGDe/6a2s9iT8ft3q3hzFo4T25BMmKv9DX/0keOeUf7Ym1OU8UIeXIlK
         YjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699448803; x=1700053603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P3aRrgT9D4tq8kw05rUVF1XE05nj8vTgSD+7tfGIio=;
        b=WJntosdrz4j1h+MaO0dPLRudNLkPE9z3FB8nnmkOkj+6ieE/GdfpmigwWaTiWlUIsY
         PHXGN7d15PmotXyAPXkBub4Ji7NixGkFMLh66jhQrx1rNIoLUSnMQJXgTDkIfLWdjPr7
         lyW3GHDjUEEnqHGoHbDjnZcaE9d55iVw1xmcxNlxbIc/WUVTVVUZ609L86GTYQulJGCs
         7GyxzmGFOGWPvQExJ34fOkrskSwU5jQArRIeloSSY8rlZO7CnjLaCsXN5qKkHfUO1Ap/
         vWWDdlvBI+pxgDWcs/Qi0PLUW9hC2DzqWtQKTFHc5v6E6BPhtmKVEd6SPnJ823oZ8RuW
         tMGQ==
X-Gm-Message-State: AOJu0YxHSonEhEMhAbipSuddIVV0SIBc+DdvxgWmpiLaqPVTYb04HUYs
        ES0es5FRWLRTMk0HJrVhCzMBtVcylpAXpx/z/LAuIl/pxlG5KgnN
X-Google-Smtp-Source: AGHT+IHKSQbkAPbJ+WCmb7XVjwTQ+/GxuKpoNvny71nI1OQNpQ1f/C0KAxlfHWLKKqD42gzde4tb1k7hUtjCEGHeevE=
X-Received: by 2002:a1f:1f89:0:b0:48f:cd3a:108 with SMTP id
 f131-20020a1f1f89000000b0048fcd3a0108mr1273016vkf.12.1699448803570; Wed, 08
 Nov 2023 05:06:43 -0800 (PST)
MIME-Version: 1.0
References: <20231106-rust-bindings-v2_1-v1-1-d90b785a06c0@linaro.org>
In-Reply-To: <20231106-rust-bindings-v2_1-v1-1-d90b785a06c0@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Nov 2023 14:06:32 +0100
Message-ID: <CAMRc=MeUsp0XcBCdtVKcJY5haMcm6L9g9HfcJkVgd9Q5g99Www@mail.gmail.com>
Subject: Re: [PATCH] bindings: rust: expose v2.1 features as flag
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 6, 2023 at 1:53=E2=80=AFPM Erik Schilling <erik.schilling@linar=
o.org> wrote:
>
> v2.1 provided a getter to read the chip name from a request.
>
> This adds v2_1 as feature in order to raise the minimum requested version
> to v2.1 for exposing the new API.
>
> This is identical to the concept patch that was posted [1] when this
> feature flag mechanism was proposed. Only the commit message was
> reworded.
>
> [1] https://lore.kernel.org/all/20231006-b4-bindings-old-version-fix-v1-2=
-a65f431afb97@linaro.org/
>
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---

Applied, thanks!

Bart
