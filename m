Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9516C39757
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 23:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730392AbfFGVGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 17:06:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36905 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730342AbfFGVGh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 17:06:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id 131so2916990ljf.4
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 14:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ngGsJ3sa6qftNEqIKxcUHf+2Y/2GL6FaDVqLdkUZI+U=;
        b=NOfBgz52VTuWpjz7V14ZcBELLxddIR64OTKQA2xzLIUhsP5/le33K3ipkbvzpS+NkU
         TWmkiy05Zzo+Sq8ohP322QzhhjfpVeWa3bmyyK/KZJLgA3RCPiaJ0nbUV6gxuUPQRsiR
         hJHfhpW/t6Z28Jy4XvFxx+geHjK/yYy5OuNGkeigArmPSC0v/6zCUFzp8bwFS1Iw/5bp
         +ekz1pj2MJaEvb2F+QqbdjFM3A6f0v3/J42m1DO7RMB9LDgmXsQxC/FZuZitbQv1Aow5
         +4H0ysai+Q1d9tSXFbGxA+jZGnU7StunRABpEMHuadstqz4nLOPTxZhqWZ+6jBCFPgMf
         fufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ngGsJ3sa6qftNEqIKxcUHf+2Y/2GL6FaDVqLdkUZI+U=;
        b=I+R/64515IUKoUnSt257tTvQw9q4JYL727GALY8yoYfBEHOmRU1zO0/EpzTSOCUCZk
         2HEakOSrobZr6gjRrCQTSO4/QUVMNaEFWWRGrjXc2/eUW8SgD2w5nGcpZPS5QrZNT0Cp
         JpMvvpQpStsMqeUKs5n61Sq6ziuiUnxQm1oWp03SYWtCBT14Dlt8HbhZkzyct4VS6DNW
         na32L43rHY3dfKzeBv6ejnzmG2LBC70jewX7a1OiObGSbOjJk0gPaXvJQ8EUblzlaJDZ
         Pvu57RkEOelTqH33l8/jaKI2efDl5v2yauJ96hnAQdgQQaF1jvpKCVtV/HE5ami6RaeE
         CmNw==
X-Gm-Message-State: APjAAAUKXZYH1n5UGrSOf3/9mC6XMQNclgOFkW9MxCeJku1ptOeBSD2E
        uvKL28gDGalvC+VG3y5aEBPwtpQxhxPiPzA83scAiA==
X-Google-Smtp-Source: APXvYqwzWHOHL3qBWLcwt+um28DnahteXeh1UMVYjgkOQaL8ZQiEb0mBtE051TG+KFU+85SgayUB0dlFm2sVY1/RIA0=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr5273384ljj.113.1559941594784;
 Fri, 07 Jun 2019 14:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
In-Reply-To: <1559097838-26070-1-git-send-email-92siuyang@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jun 2019 23:06:27 +0200
Message-ID: <CACRpkdYYYxCti4zRzF1bG+cb+NAONVjg1ynOww5DpG7dzi1B6w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ns2: Fix potential NULL dereference
To:     Young Xiao <92siuyang@gmail.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 29, 2019 at 4:42 AM Young Xiao <92siuyang@gmail.com> wrote:

> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
>
> Signed-off-by: Young Xiao <92siuyang@gmail.com>

Patch applied with Ray's ACK.

Yours,
Linus Walleij
