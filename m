Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F675BD0CE
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Sep 2022 17:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiISPYL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Sep 2022 11:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiISPXq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Sep 2022 11:23:46 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D537E38699
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 08:22:58 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3450a7358baso343059247b3.13
        for <linux-gpio@vger.kernel.org>; Mon, 19 Sep 2022 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=VGsIUsj8zR91kA38VZ+J7ZVasL8IydpunOkOWGiiDD7Xh6P+0etb4EG0Z9QqvtoBnZ
         DSI1J22/SYKrdQL+lzfX7qsiNDPtr4N11qd2LsDUFQKqu1ZPnOvIvLURDgE6mV5if0Pp
         AKN21RLSYjjVWbEx3L8nN9bb+9zrNsB2gQoJIB3GSUq8J4N4FEmEni6vwKi/hyGXXKXp
         a/kAefUmaWDcPEcln/rpYRpoAlg79nk/iiwYm79zBK35ss61KbM/bR9OTykhThq/bT49
         a9uJ4bkdygk0aSDaklWZgF49qPslCJP2xkjr/cF9eUMlPc4odQUThxnvn86VBsL+5L40
         yDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=RbjUSs1my9Qr2sRjjt9JVqeNizQy6hNUKTelJbIxlJsrwCLkuFSxXDdyq85Iy29WDw
         uFzUikkmQkOAJ43PWPgG++uGMsoBmQHgjfT3LAWNb2ujLAuQh0Ix2oxc8b+7gLys0W7H
         UogHIQZvf5+a6lZ72mkiL/3+r9RLVd0gAJ8EnIq0flhaGquNyUX2fDEGJ4jJtfvtCDZy
         U65OfE8w4gFxe6n6LYPIW2gOfm8QGpe0dcVp0xgVCrKrDYjgR57UPssVv91xmYFx9X4g
         gtdjLE9z9PZobV0cbQ7YJ9Dh+desxY6t3o5bajsBxzaFQb5UxCuXteTbA8yvtGqrt638
         83Jg==
X-Gm-Message-State: ACrzQf0gkYEnxpJSzodLUVxX+HRaxW7EJY6SlrqIB7Vdnyca7qSTbD9F
        MZ3+6Wx8MFEh6bGZ9z5eLF7Vo0LlI1e2gkWdluA=
X-Google-Smtp-Source: AMsMyM6Il12Ic6lgbqHOAhY5oZIjj5MV5O08koQ+Dw42jTgiPw8tBnsB0JN6fALx86mZ2SqpTVOPWyQtHoEHGyW9YGg=
X-Received: by 2002:a0d:ea8b:0:b0:345:723c:fb15 with SMTP id
 t133-20020a0dea8b000000b00345723cfb15mr15014277ywe.469.1663600976271; Mon, 19
 Sep 2022 08:22:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:76d0:0:0:0:0 with HTTP; Mon, 19 Sep 2022 08:22:55
 -0700 (PDT)
Reply-To: kl145177@gmail.com
From:   Ken Lawson <engrmorganwalter@gmail.com>
Date:   Mon, 19 Sep 2022 15:22:55 +0000
Message-ID: <CAM5a-p81RS6T1k+vF2fai+PgUjwaF5hAkS7v0UqJgMChOhchzA@mail.gmail.com>
Subject: Did you receive the email I sent for you?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


