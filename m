Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF244DC82
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhKKUc4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhKKUcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:32:55 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F7AC061767
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:30:05 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so2658661otj.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c8dwJaksGQJsxMwWrR9ri+8u4KXcRbKUrExUavBRwpo=;
        b=PkdaGB1Td7UXM2K+KDPzSgPpaBAwDAGFIkTvpjz9sTvkFys0zJ4pbVFdi4prbLNB7r
         a4v9r0dCKxQsCnwFZiz+0OrI5zTtrGsEm25Bm/b/tTxmS3AwXa6jaS5Xh55UroqRSdwX
         SET0DlaLMxE3/WCM1ogFraoymNwLb6bqEkYOBGoWpkcxqtLDShMkx84Ui/YqNWhWeGrh
         W/rKI4p1tDGy5r6kLyV2n5EBFAEnMgtHTuYo4nF9PDlg3KO/2LepecGLYnfbehcNmbiT
         y33m+wrXyeMuxzmCGnnGKQsGFP3yeVJAUoDtSqXjVwDBuTnId+JUpQdTXlbx9g5klc42
         LIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8dwJaksGQJsxMwWrR9ri+8u4KXcRbKUrExUavBRwpo=;
        b=h/UqRws7PBkyn+3nfOo6xhsDBJl8Z2X9S/mCz2nC4vMNbPL9hfc1g1jjbqcxnnu93V
         4O9LobSd9hyhQtK8EyKwFXJ4aSpYUF+wnjR9rqRfeV1W4sX0p70jAzpzYkFyAS9etO/f
         B7tbaL6H5DkT1g3Y3eQ0A6TY9qBdu803vNhhSmkGlxsDPkB6JpH0pfKjDRFNkdt2y7wO
         o1dKhEkIffIZytj+GuIlrd9ZLj7T6YbSTtI6lGbQndsTbTL61kziozGWXYYmmfF1jlQH
         L9Vm5/e3QPDXp7dxJbXmQTp7q4ajzSpx4v+6dNIztX4+oSmLPZBC1LXcIjisLVow/8Xc
         btuA==
X-Gm-Message-State: AOAM532WMG9jCh5y9Hv9J05xI67EhhaLz8aMb6tZc6lOMmBrgiQWOyKV
        7TKajNNXVGOEsggo6PNf0Kj35Pc1rRfg5LD9uB6xtTwKVFU=
X-Google-Smtp-Source: ABdhPJybpt+Qn6Zn2ZF+1VoOxbUW02/esoG/7GpAw1tZgcfsI5R8cK3bpHCWXa9DthYKjDYIZcZzizDYqQW+sPuCS9M=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr8024846otj.35.1636662605317;
 Thu, 11 Nov 2021 12:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20211111202506.19459-1-brgl@bgdev.pl>
In-Reply-To: <20211111202506.19459-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 21:29:53 +0100
Message-ID: <CACRpkdZ-DY3YVRDZmpU458wTqeNy0khdfJTNDk3UBjnX0zAUHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: improve coding style for local variables
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 9:25 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Drop unneeded whitespaces and put the variables of the same type
> together for consistency with the rest of the code.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

OK then (also results in inverse christmas-tree shape...)

Yours,
Linus Walleij
