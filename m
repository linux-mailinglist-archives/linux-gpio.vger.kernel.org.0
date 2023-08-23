Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59307857C7
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Aug 2023 14:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234828AbjHWMSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Aug 2023 08:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbjHWMSG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 08:18:06 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951F9CDA
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 05:18:04 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d71dd633f33so5464769276.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Aug 2023 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692793084; x=1693397884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmRPuzk6B0m4SH/I5wCSK6ogm/UxcY+6CQ9zQ4c2sm8=;
        b=ksJ3A9di8wXLlpe5WYXmUb4ek1a5mvNllNfTH7aChvsEA5uaHQa16758juMKVuZONv
         +fhbFLOUHsuZGrUcWp4q7JCHhf+furdtiLZqZwPUlFQs2ED1q3a59rEYoahZCiMzGd+7
         ysZsSlmWo7UBZgyiWGv19gxR2xWlFIByAoXgAc+Lv/17a0fOE34opmOTVsiUAH+F60zz
         O4gx460hJkDJFI+xg0oqcLsBGXhM8DKkFNOLh3x8oHk6XTNuYmckaXTu6SeWGaearWz6
         9nUrlpYee2ZCoQWY/VFbwuaMlNINB3tF8yP2v+nDjUJPB8dy3fLUnsOz81sofI5wIGS4
         NpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692793084; x=1693397884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmRPuzk6B0m4SH/I5wCSK6ogm/UxcY+6CQ9zQ4c2sm8=;
        b=QyJ+j0SrfkZtgYVoqSqsIpPdZP4NVjOpSR17Ty9GTZ55pH9pVgWHpu+YUwuZFpCGo6
         /x5e7TMgAvu8rVVb5N90kJmEcWVmp3MxG1fSnTTpG25sTQ/ycEML/7Gs01N4vBJB6Vr4
         49zBSetlZu4LVp/PNpNhHszvZzxPus7IqPEepbNSFqOtgBWrS/C/FOtytnUUTIddG+b3
         OE0NphPvkz8qLPHEfPnjpY2+Y3lHtwEEothf2WiiFsU9m0rlTCqjkVKdYfVGjugkGZGQ
         QxlnUcL34J1tLW01B7KkD/G7JuoHbOod6oMlAQxkwsiF3MyXU1oCicT+xNhzTh3QdxPI
         bVuA==
X-Gm-Message-State: AOJu0YwYAPm1e7+UKgsk6Rc/17HcVK+GAnv5eJcA8AVdSy+QSDAuOFl3
        dIf/k+enQ+KDaRh9awlnsKYCQJGWUBSMVNyGEWFm/PLkXdudyGty
X-Google-Smtp-Source: AGHT+IHn7O6m5ydCqj9juu1GGgOSyboUyCD5MCBQB+5PeJecJJi1TDgtjcDC2J8kLS3EsmrPUDCad9OJfWfNMDYrbgw=
X-Received: by 2002:a25:5f45:0:b0:d48:a723:6d2d with SMTP id
 h5-20020a255f45000000b00d48a7236d2dmr10809241ybm.51.1692793083799; Wed, 23
 Aug 2023 05:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230823033427.23072-1-zhuyinbo@loongson.cn> <20230823033427.23072-2-zhuyinbo@loongson.cn>
In-Reply-To: <20230823033427.23072-2-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Aug 2023 14:17:51 +0200
Message-ID: <CACRpkdZXrH4R6TeYfyT2i4zvuzP3+nwP9=RhyFJujFrhc7GG9A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: dt-bindings: add more loongson gpio chip support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
        loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 23, 2023 at 5:34=E2=80=AFAM Yinbo Zhu <zhuyinbo@loongson.cn> wr=
ote:

> This patch was to add loongson 2k0500, 2k2000 and 3a5000 gpio chip
> dt-bindings support in yaml file.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

Thanks Yinbo,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
