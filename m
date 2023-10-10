Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1BF7BFE23
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbjJJNmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjJJNmO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:42:14 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BA2198E
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:40:11 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9a50ac5eabso1032569276.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 06:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696945210; x=1697550010; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=iU+P3jUeRQTOL6K8ZiDZpR+KxqDJiJG3z20HoibiZzHaTMmxvrL4wKGecYVe1LCh8s
         U5UnCHXJZu5h8IRri2QyQs8bCoBwD3bt4pNPr6Y4E3YX8VHlo+WpHKBXDgzwSyjth2r+
         /3foJe+ReZ9QwQuASSc/t1aSqp3yvhnkh9l78EwZ1UDJPuPev0p/7ZpZ4hLG6vOiM3Pp
         yibqs2Z7q19YZgOWPkrNyTz8ECEqw7nuac3AMWIfx8tgN2trz7n2QxvVtNjraHGqfG1w
         ISX6q3swN+1eYbSkLBp62v2Ka0IPhnmzxDFsR9yoSK9X+gGjUiTidQBBa8IBQEPk6jT8
         6zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945210; x=1697550010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
        b=YlrpFmU4zgsnu7Qt5sb7p/oHKlWbEzBAIZDlvdZBL7JF7bVHjqopLvalYboJZWo2WY
         3O1x+/sbD0OQrq/F7TL26E/DOWVwarBUbZVlYf/BZEHIqaB8gLPHbrx+hqF+xjJYl1r6
         +sGJIF1PyyZRNB7/rVdCrAw0QzBAd97BSMQE9pVDpYp8DMJyOZaAjn9MYCYPtK6/5fP1
         0mw8tutatDWUK4zLBZsIMV/d6/R9i8Gw1qRgrz5/3b2q829cqLPDFUzSF4o9xye8TJML
         ITPWYXnDWHMds2uckx+MIdAYes0dXdYy+KNHrNow60dWTbgDpVITBG9U9WrE598N8a25
         ULfA==
X-Gm-Message-State: AOJu0YxCB3B1Uom00W4Y4vee/L0teStP6cSRATzBYVQVSnZUryeQW8EY
        oaIvek7wfWuL4tNArEQgdNUk8bhG8xwzJtqmREdE7IXGZGCzG2d+k5g=
X-Google-Smtp-Source: AGHT+IERlhK31X3rTtl/eFbhmoKroyjEbbBwMmyA9pS3eknMyDbLgAnhuFLtBvx1RksawYaE6uLXmvuEw9HUPksW4Bk=
X-Received: by 2002:a05:6902:1105:b0:d81:5436:9893 with SMTP id
 o5-20020a056902110500b00d8154369893mr19893265ybu.21.1696945210160; Tue, 10
 Oct 2023 06:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de> <20231009083856.222030-11-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-11-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Oct 2023 15:39:58 +0200
Message-ID: <CACRpkdagxBPxa+BmmBEn_ngNr5u0cVGj-Pda7TMLqv018o5uew@mail.gmail.com>
Subject: Re: [PATCH 10/20] pinctrl: as3722: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 11:22=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
