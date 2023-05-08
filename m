Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD816FB1F5
	for <lists+linux-gpio@lfdr.de>; Mon,  8 May 2023 15:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbjEHNq2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 May 2023 09:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234221AbjEHNq1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 May 2023 09:46:27 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC6E35D94
        for <linux-gpio@vger.kernel.org>; Mon,  8 May 2023 06:46:14 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-55a83e80262so67498597b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 May 2023 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683553573; x=1686145573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtbChOf1tjuBGN4NDKgEEhazW09wYkOh6AQbXDOmpHI=;
        b=JlOrjF/+6+saQagRBCzBr90QAHbMkvCEwgM9/27PYOxIRywYYESAHoJR9u7Fy7qnzP
         hxTXC0SmZsWjmAxtA08YtzkbjPYRCNtzwuwyV73KeQVPJnqiGT2loTqFiy7TLoK19ZTL
         wc6U+NVS0x4yr9WBfeMQK3+yie9DYZi35i7QgHQ6WZc2SgkCAngVm72M8ZCRPyB0BwID
         ZvKp0bfjda0eVMbzGlQXp9gaT4VcNBQSQSb0jQdXSP8PF8k1FaU7rLqN/i3A/BB8hu2V
         gr3FRAYqr9jYPOJ2jtnRFYM3FE6iHPQoDN+XBJvxFSHyIDVjAT2al174N7gWPjk4q6pc
         n6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683553573; x=1686145573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtbChOf1tjuBGN4NDKgEEhazW09wYkOh6AQbXDOmpHI=;
        b=OEehui/fZWYZ2CC95I5NRY0gMjXYhwZ8KtXuOUOKfNoxDnUr8DvKXNDEQDRXZKhFa3
         iSTtF3wwix6RhFojfiLT1yf5ORJe7F2sbGW7H5q66U+EGZhhP0T7GDRMaXT9OqYw8UI/
         qKWlKXzL8O91WBW1/aF4W2TUqHwamX7LSc8oKKPOWoITK55Ta3DhinaNbIeS+SmsioBl
         w9/ME90nwY190VmRuFWGIq0JKk17jUdcEnFrOdmmfzYfykzGqPF3ntSlJpsf/4Y8fjzL
         gP6y0FDpxqVJUQEUuot0lDhUKwYML6OQaKLEc/SWsjMhIkbF+ZX1XrdqVGfETLRAejZh
         9xYQ==
X-Gm-Message-State: AC+VfDxTwccTAILCT4id4Jbv8gMaQ4tYrRYCfjYVDnxoio0Owx4HOJ1Q
        YHDG1grT6rLvTJTL/tT/CGe0EnppxlAiUY2pcE0uHA==
X-Google-Smtp-Source: ACHHUZ7AGqNntEBQYHD+CeYee2P0eMMSqdEwKZO8T8dqMJUpCyHjSg1QO68c8TmNAAKY72R8N/lD4uOs4dL5ZW/HQWY=
X-Received: by 2002:a0d:cc0b:0:b0:55a:9b56:acee with SMTP id
 o11-20020a0dcc0b000000b0055a9b56aceemr11702886ywd.38.1683553573515; Mon, 08
 May 2023 06:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230508131848.142602-1-milo.spadacini@gmail.com>
In-Reply-To: <20230508131848.142602-1-milo.spadacini@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 8 May 2023 15:46:02 +0200
Message-ID: <CACRpkdYN6XCw7wyGPjmsGUqbbF-3N7iSURAB2rqwurDFKdT5ug@mail.gmail.com>
Subject: Re: [PATCH v3] tools: gpio: fix debounce_period_us output of lsgpio
To:     Milo Spadacini <milo.spadacini@gmail.com>
Cc:     brgl@bgdev.pl, linux-gpio@vger.kernel.org, warthog618@gmail.com,
        andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 8, 2023 at 3:20=E2=80=AFPM Milo Spadacini <milo.spadacini@gmail=
.com> wrote:

> Fix incorrect output that could occur when more attributes are used and
> GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.
>
> Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com>

Thanks Milo!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
