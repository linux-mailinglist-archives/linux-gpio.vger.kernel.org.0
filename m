Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00567BD418
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 09:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345379AbjJIHMs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 03:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344984AbjJIHMr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 03:12:47 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD664B6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 00:12:43 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-49d14708479so1295723e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 00:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835563; x=1697440363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=0L2XxtY72fZ9t0ivQdB48xalEXRi8tzZQB4h2VVaXkaCn2V7OpVzA+Jzw7PSesRZXj
         XjlNikuHh78hefd9Y33mqrdbq/rMRMui54cSBWfrsBGj/Q0a61bQJU9BQa4tQNbTWoir
         2IATn7Z9S2rzHz7BBjsN3uEeWSXiFTAO7z48vM5gaYa8rZi2yWq8SZZXrlZGvHiiH6ob
         fEgRq5SubFO/NJKrC0ILwg+vJlAnIRwC+Un8rr8mMblvUHhbYlj0Sm6tQNCy78OrQ2yY
         9QT1Vu4VHmkqERxqHC0vAZCZg6/mRPJMQECZoRDX+bticDcLl3ZgpNa0tOIPrkpvKY6u
         PaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835563; x=1697440363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=DhNjisGQt9jSHIR0Rwd/DWKMDpF/jqDo9OqjhAoFQvMU+4+qarfieLxnlZ8f0bK2eN
         omad6JHCk+Z6C8SAB5JBQB7nqZbsLp1RmDQHg/Qym865qQcHQPrnIBBMd6LYnoGOtvdM
         cfwTl6OGc/U0gy1UwyKl9AoZAB9/10WyuCbT8/9dz1SZKPp/njfWnn9po3JlEKLTryT8
         P3hTc3rYjQGR6xzn7ZujOa4rcECxyhTWpD0x0c9b/b8fNdNFWQDzjrbJrSYAWxuSuOu0
         W73Htia8M2hQZ9lkvezeQWVjX3LMiyDDjp1WKoyUXP60uLSdKlX3DsBrnI/4qhpkyvUR
         QcOQ==
X-Gm-Message-State: AOJu0YxPoA9WGylmSoEyqYZMXLpd+cBGe115tAotmoemy8fB38Hzqjo/
        HPUAd7LlDaXxz4Y5hJEfo3YcqxT+4mRpE2oemmpZV7OIe0YFUccwzEs=
X-Google-Smtp-Source: AGHT+IFwDwzm+lRsT8bOFKIAm/GhR+1llhPbmAbOCazbvOSuFiL5J72lfZwBACd3hGJsn9Q29a1UTTr3OVDkXyj/GAc=
X-Received: by 2002:a05:6122:222a:b0:493:5420:f20c with SMTP id
 bb42-20020a056122222a00b004935420f20cmr13749354vkb.10.1696835562966; Mon, 09
 Oct 2023 00:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org> <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 09:12:32 +0200
Message-ID: <CAMRc=MeVp63fPXWs=JDL-GYg7iYzL-m=3nkrp6J+nyM_pL2=tg@mail.gmail.com>
Subject: Re: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The driver is pretty straight-forward to convert to use GPIO
> descriptors, however a separate patch is needed to accept
> the DT GPIO resources ending with "-gpio1" and "-gpio2"
> instead of the standard "-gpio" or "-gpios" name convention.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
