Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9936FB18A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 15:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233886AbjEHNb4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 09:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjEHNbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 09:31:55 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12EBE62
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 06:31:48 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-b99489836aaso3880714276.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683552708; x=1686144708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nr9w5cmS2eq49rL51s0xqNBBfFgzUL5Y5GMD9MQOesQ=;
        b=TO3PvQZADCj0COlKZ4+WHaCTfp6EyaO6auN7izNpEs3K7mdd7CQI2Y8zsFlZFlZmQ8
         6rqM4PrkJ8yQGZVKZUiWjnwDXDvRa6dN2LCqcBqoF5gEuwvjm+fkMAMOC8uAD0pw8URA
         DJc+2/MybkZyF8aPMRXjty1yFohrH6F64Tcf+JhIiMQVfGSuPn7lmlH5t4zKAKsGweUn
         XRJ2J6nJi27rAWu3tyb6hi0FkjkJXDZiiiZbOw8/7rm1Aymjski5I8qj+loUM///xN4G
         BCoc9CwzSkHELG1OQFHiCeQfemwxer0fp/3g2J3r8/lyEfzAXPxSj4PmiVNlP9X9bY14
         LbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552708; x=1686144708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nr9w5cmS2eq49rL51s0xqNBBfFgzUL5Y5GMD9MQOesQ=;
        b=QpRJYB93xLeTw1G0ITJGNMSjbHU2IAxSN1TQlioUNkfFOTI+IFahUSZklEpVvxRaHZ
         Q3dlfkJKZVP4QM/CDMFEnFPss+NPZ2k4zlK00W3PvdiaaVFZKPaRhRDa1hE5n941Or6e
         iX4HstYltV0g/E+CpyZzw/q7mNZUpno/6oBM+HgDD/4zYArIOpWI7lDLYp2JOY4TwD4Q
         vRJ50b633LK/nXuhZ8JnZQ8Vf4zUEbpMOJRrNPPTtI3FL1OpQV7Pu3tI21hoACHKmuv3
         t5AqkNpyw37nkn9KrXLO4vOZTSN9R9wf91KCeC3fXy9wLQjeMtGkPYKQ2jf6rmgRaIpA
         rupQ==
X-Gm-Message-State: AC+VfDygHg6N5IBUyKOV2NN+5y3SfKVa0Lm2Q2KNnAAyh92gn0bu+HNB
        l9n+9HV1dgKSs6mIxVpZR/udByRBSXfd2TSaanN9lg==
X-Google-Smtp-Source: ACHHUZ7wAqyTe5iPHQGaSdYgh3yDOd0MhcEVy5FmoJaSUIRilMmSMYivYIKa/FJ4sffOGbGiXaYB8ob851Z0KwlH294=
X-Received: by 2002:a25:25c3:0:b0:ba1:9c87:113f with SMTP id
 l186-20020a2525c3000000b00ba19c87113fmr10800782ybl.28.1683552707727; Mon, 08
 May 2023 06:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230428061109.102343-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230428061109.102343-1-yang.lee@linux.alibaba.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 May 2023 15:31:36 +0200
Message-ID: <CACRpkdY0bX_Sw_6zxmp4pPZD1+_mhYhO7XdwpX6NiUyiY-=wuQ@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: brcmstb: Use devm_platform_get_and_ioremap_resource()
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     brgl@bgdev.pl, opendmb@gmail.com, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 28, 2023 at 8:11=E2=80=AFAM Yang Li <yang.lee@linux.alibaba.com=
> wrote:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Looks good
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
