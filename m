Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43213C16A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 13:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgAOMpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 07:45:42 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44912 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOMpm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 07:45:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id v201so12584447lfa.11
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 04:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zw7fLVZlBWPnFhNuSoVVujGBuN87u3KYLlAHzC+pN0M=;
        b=p609hwBlIti1BDsa7AwFn6dgioFQ0T7bs0x5a9KD1WrN+GkE0lBl0ys22xowzPOQR7
         V3lR5+PDDQjvesDRY7vNcrJl8xPPyG9qkeKXPvq9oVzBZ3FUI64ahWTx+NwqkpTi6l/2
         GXCAV+iOUL1CkpVjVjNKo9rtmIKvr+aLjKD79JbVXlAZvE9IfzPkiuQUdBZbMuDZS/K9
         W/81pW8YAKB/Bcu2v5tKncJV9mNNWW2hjlQ0IlP1kgKmNRp1JEmSrpGp4mOIpabiaTVq
         vL5bFI31WSMmy9zFuO/najdCeBAdjCD8+E/Odh79W28kiLQT22RzQxGGD1U4Er2g8AvD
         PB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zw7fLVZlBWPnFhNuSoVVujGBuN87u3KYLlAHzC+pN0M=;
        b=sTIEJ7KabWW5B3gnwkDOlxSk36cTfRD9yFO71NikV5C/g8OBzT0Co77aGPBaQFBq1O
         ohuNGRpsDP3jC1tX+vlmpt3R+SKg0Jv40GYrVqz9/AN/2wjfXFcqvTniMAqLyjhUS44G
         94kNC6MKGYi4dhcdGbfowQ6SW7kXiFffpk8tLAowTGEeCKCZYKrPQDHLlGLP2qloRY69
         qnTxUQE3lBWvKg1qqdMgkfT+5OskMJ7rZbKkTGME20LFHFaAMfqVH1WM/IkKKrkZqQre
         +D9OAFnt0XoVZ3QQ11K+NZ2qGV72k4hfflt8G20VnaBy988Tw9cdOPJ5P2ALKFDVm/ut
         HqBQ==
X-Gm-Message-State: APjAAAXMruRD6iB+7jNXaKegGyykqi2LZnXV2f+R93gj4xCdq8qD97R1
        Tx4wNnvOCD8uNt70t7nlmfiISXH03UNIv/i9LZmUhw==
X-Google-Smtp-Source: APXvYqwSaA74Wo0u94HIU5oNVPlQJPvUFTlEtrMxfPTAIykGqb3bFAFJMktSIsrWP4Hs5KTLmEsFohek2rxDoppQqCo=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4407533lfe.205.1579092339536;
 Wed, 15 Jan 2020 04:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20200112143312.66048-1-sachinagarwal@sachins-MacBook-2.local>
In-Reply-To: <20200112143312.66048-1-sachinagarwal@sachins-MacBook-2.local>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 13:45:28 +0100
Message-ID: <CACRpkdZGkPgB7wh3bKeeu+rD4_YnXLM9aLFt-wKti2YkU7yVqQ@mail.gmail.com>
Subject: Re: [PATCH] GPIO: vx855: fixed a typo
To:     sachin agarwal <asachin591@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 12, 2020 at 3:33 PM sachin agarwal <asachin591@gmail.com> wrote:

> From: Sachin agarwal <asachin591@gmail.com>
>
> we had written "betwee" rather than "between".
>
> Signed-off-by: Sachin agarwal <asachin591@gmail.com>

Patch applied.

Yours,
Linus Walleij
