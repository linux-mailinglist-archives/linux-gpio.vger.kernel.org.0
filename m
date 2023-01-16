Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB6066C281
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbjAPOo1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 09:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjAPOoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 09:44:03 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15C9241C9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:23:05 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-4bf16baa865so381775437b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 06:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrG8USpee5d5rNWBlvzv8XipZM7TAALtgtE7SglTs30=;
        b=VOYSJd4UyJld1hJAXMB0jIcoDMAx4xPM7FE3c0ZDwCKoqIEhncfHIsy6/XgrawUSzA
         b5CxB86qIlBKMLMPNdUNp+gS/oL/ULx+adeTqZrTXCnaZFv8Wp+e+xKAsx+lhdR62Rg0
         4vwQ6P9aVbRNqU3ilRrY+mZ5Ov/KGcQWRJ3s8s7LuLbS4Hs8zDQ6fID6q04U3le2paFh
         PQCKHwB+ngzgCuOuzEWAYhuZgvneFTtMm43tRfG0AjzGY1XSzUq6woYliV41D1nhCVwz
         D4CvYiWWKzjMbrLSmvv2K5tS7PJFcsj0B6EKm4P5UqgfcxcX5tNDa8BHOo2wRpQ9PWWm
         dhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrG8USpee5d5rNWBlvzv8XipZM7TAALtgtE7SglTs30=;
        b=d9o+kdsuTCnMiHPR69Zva+BjMwFD0C1+N07ec3fNJrYtXhfoPbZOEKbVTGhJqx+0J7
         jvkDnNsFnAeeO2l7iuYZqKKrP4GWOunueFJ2NhKtus18Xx06gspijYy3TuD6wvi7TyfE
         AP5/3mguJbE3V2T10Utd47rnSVsX1UUUa9G7B9Byr8YP0VlkzDFnKHLEdU32QvOS6bLd
         VfX2XTR8R0j9TWs2xnkZoq0EGS7vvTbzGn1ZDtGQ9dKdwHEkYOaIPeQvU1dAwj0ymxGg
         OUqOC0qodYW5RXCpuN+MpcpmcFAmoWQg4R3xU9OizTaRhuzza6/qCiuUHdrjsxS4Ttx1
         fWcQ==
X-Gm-Message-State: AFqh2kqAqPYR7n9sgJ8rxkwFKp6/Dib5BO5RcRSAcK1HN3XR+p3JNDlZ
        JtJ9wlvOTF2pTtAJfExTufkY1J7TYlEa2iTho5kDXUyskeICWQ==
X-Google-Smtp-Source: AMrXdXtChsbbTZNDXe1gySkRSuzna8QQFr1MGbu9r0oBVv+Ppbhm0OUi5vkrGOYybn0VbTOA+zXlgg5crY+ROBhDh3Y=
X-Received: by 2002:a05:690c:e0c:b0:474:b3f2:8df1 with SMTP id
 cp12-20020a05690c0e0c00b00474b3f28df1mr3479036ywb.434.1673878984894; Mon, 16
 Jan 2023 06:23:04 -0800 (PST)
MIME-Version: 1.0
References: <202301161545238948580@zte.com.cn>
In-Reply-To: <202301161545238948580@zte.com.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Jan 2023 15:22:53 +0100
Message-ID: <CACRpkdZHA-Z1CMXGb5iJv6JmiDY+DHwUf2nh8ZwBQkRwaZRaTQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] pinctrl: nomadik: remove duplicate included
 header files
To:     ye.xingchen@zte.com.cn
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 8:45 AM <ye.xingchen@zte.com.cn> wrote:

> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> linux/seq_file.h is included more than once.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Patch applied!

Yours,
Linus Walleij
