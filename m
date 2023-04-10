Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 299106DCD63
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 00:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjDJWU4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Apr 2023 18:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjDJWU4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Apr 2023 18:20:56 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670E210DB
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:20:54 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id ch3so7238591ybb.4
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2023 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681165253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY3XURVYWCIcemLAr8O9Wiej+aFCql/3yCAZTzhHcSs=;
        b=VNcMwyYOH9xebcPuWV3dFdUJ5t+c0vlfeyFbDGAu53qPX29fh9SVStP0ZvJlPO9b0N
         HGUPWUOezP7UdaQQly+jeaBFl4E8qA23Xz7uxqiFVJjVk06p7HvPKC4HpaDgA8hjHlBi
         xJBgoAeN9xkOU2PpC0BwJVbfKvDVoS4lkBYBu7KCqS9MyWvrgGRFOUMaHfjuNdMcBmlB
         t5whbFRg6wPG6/IAA0+edaA3s7DXYbZij5R1ZQaaXIj+Tt3Udi0gJGEY7J1uyw+DDF44
         bqlj3OBWyJdp9QC/BJ6N+JzIVYy9nIQ6qdWDa2V8vJT4WNdbz4w5/eAIynxyAnLll+gS
         mBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY3XURVYWCIcemLAr8O9Wiej+aFCql/3yCAZTzhHcSs=;
        b=NAKZU9XR8iU+qgp9x3Z30lvw8NRaboJaoMb1rEI+CKkyMhr3GqjvacZCfQhbq1OjuL
         x3k5xNBAYDU7FCNyNf+tpMO+KzBBHCpRPbq/aNxIQwUBe8dBubKTRUtkPQJgPWfmBteX
         VXTF0GM6F36uS0rJ3aHrIaZJ9zel7aA+i8A3tohqn7FOfo5JIJdxa+ufw8amIWAFCFkz
         fXKKQgu3DQD4FyrJQ9DsCKaGuhamAxRu4/bzxUCszUyNDQk8dsnJS+Oet4cLNqflgtQw
         B7ZnCumbTZaqjmp6wzauMZ2RcQTnl3+IKHnYTscQHaMnX6/4d+9YhsQiJ1yYClxE8TTr
         Nt7Q==
X-Gm-Message-State: AAQBX9f79CbVf45NPAxYWvFGhvfERx6/7Hr3CPNBNmgbnKFs6pHY3cRV
        SE1v9BwAZBSBlJooI5NyySSs6BxGHDK7i9ZA6qJhPg==
X-Google-Smtp-Source: AKy350bXiLysNcV+Q+/hru2MCd67dq41AQdoznEw88BUw2uC8Wa1FCc0rGVz3dTyK37BVHXOUEC94ofML1oMScjzdTk=
X-Received: by 2002:a25:d994:0:b0:b8e:fbcb:d6ef with SMTP id
 q142-20020a25d994000000b00b8efbcbd6efmr2648692ybg.4.1681165253591; Mon, 10
 Apr 2023 15:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 11 Apr 2023 00:20:42 +0200
Message-ID: <CACRpkdbXvMsa=suwEZ64b1Jn9Tp2mD8CqhmwLhSHdtdAOBzN-Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Cleanup Mediatek pinctrl device tree binding
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 4, 2023 at 6:30=E2=80=AFPM Alexandre Mergnat <amergnat@baylibre=
.com> wrote:

> Deprecate properties which shall not exist, leaked upstream from downstre=
am
> kernels, there's no reason to use them. Here the deprecated properties an=
d
> the generic properties which will replace them:
>
> - mediatek,drive-strength-adv =3D> drive-strength-microamp
> - mediatek,pull-up-adv        =3D> bias-pull-up
> - mediatek,pull-down-adv      =3D> bias-pull-down
>
> Another commit has been added in v3 to make it easier to merge. [2]
>
> Thanks AngeloGioacchino Del Regno to reported it. [1]
>
> [1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@col=
labora.com/
> [2]: https://lore.kernel.org/all/20230203-evk-board-support-v4-2-5cffe66a=
38c0@baylibre.com/
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl=
.git/log/?h=3Ddevel
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Patches applied!

Thanks for you excellent attention to detail!

Yours,
Linus Walleij
