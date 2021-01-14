Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC44F2F6402
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jan 2021 16:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729134AbhANPM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jan 2021 10:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbhANPM6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2021 10:12:58 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F807C061574
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:12:18 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id e25so5015623wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2021 07:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kBGX+T/nUpbDAUJb5D4Xd4HLcz1wI0XbFT/wkU7AZ2w=;
        b=GUTI3PNCNsj+/QXxIkEVbWJCC9QMtvyaEjYn4bN5gNKpxMv0LLzadv1QY10cEEx7wR
         Q390OoA37uoZQ/cLz8pOzgQ4+QKmCcsQra/Y++yYY204JVbudEPwN+Os2Uoulr96RK1P
         IuVQI01B6Luoq5MtkvvtCIjbdeqpVbkUvLiMZf1j/y3IPGbpL73IvS8ZZ1dZlDCmQ3em
         KIfFF5UEIhb3xbKjblxsa539Gir80GLBFxADW3SKrELdrBlkplFlzvJ3ZRMiwoz+QOQ5
         eMwSjfsrsIqOeVDQWVHwKfOq80gIxHrN+Il6dpNpvrattLP0UxekMGhXrRSQlX34hDXJ
         Qhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kBGX+T/nUpbDAUJb5D4Xd4HLcz1wI0XbFT/wkU7AZ2w=;
        b=mCpBLQT+EmJ3pN9/71VkpygKW5DDzeQa11ewbxvisB5q0NMNgcHpsMN9zrxYKryVlF
         PHiWDhl6tv+ylj9ixOuijlZyPuC1+w0frYSCtq701CKtu4/N+7rhzHTOvD/la9Eadzgu
         UXXiqMJSoZgf6/bmY2O7eTJcXHnI7mXb6We36v1caQ+HvwUYMAVcwGDU9RD+Dm+knHyv
         LMO07i/3iOOpUYsY2bSVTL91U1zvuIO9jXYKV+PKPawfkL788WeqMldk2pO8icCTG5EA
         3SIaehY5BwkGPBjiFgMe1yvUcvc7BU5q+p8zMb4NEWT0TLzpH0dUXOgQMcoJCo6f1EtP
         e54A==
X-Gm-Message-State: AOAM5330Iml58TBe3rs9b0Gjex2k/eaoaxNxghkvWeuhQ9ybW1kL9olq
        8QIg+W+JvKgtFi9xilzSkKDWOmIJslVmw+aszaGe7g==
X-Google-Smtp-Source: ABdhPJxD+gZQ18YWuLpswN7xfWgJaSU9o6zr4ikxgEjS0q8DG7825uh6yRHmP4fOBTKhgdT5PSNcs9bqCrCqSc4Q8gY=
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr4409187wma.3.1610637137068;
 Thu, 14 Jan 2021 07:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20210107025731.226017-1-warthog618@gmail.com> <20210107025731.226017-6-warthog618@gmail.com>
In-Reply-To: <20210107025731.226017-6-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 14 Jan 2021 16:12:06 +0100
Message-ID: <CAMpxmJUok4oJHG169yAzREnu+hiMsf2Fx1oJGjzitWk3YS4VUQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] tools: gpio: remove uAPI v1 code no longer used by selftests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 7, 2021 at 3:58 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> gpio-mockup-chardev helper has been obsoleted and removed, so also remove
> the tools/gpio code that it, and nothing else, was using.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
