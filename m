Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBD017DC68
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 10:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgCIJ3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 05:29:10 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46312 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgCIJ3K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 05:29:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id v6so7025552lfo.13
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/x3bOS8+EQ730wvwzViwYAyxSIAy+Gqe4DlDcCBFmac=;
        b=e7eCoXwJn2Jq3avlPXDgQK9Rx/D9sv6dMMc8asjsu4JqGIdjFQ3+Tvma1SXSOhr7YI
         gQznjl6GdDgBkjgwCtHbuqrUoNwW+q1mYBZlXjqVLNH9OtaWlHwrTydkv/lBF9uMCHLo
         /2D0ERQdHCCCHUQ8MgMPH6ocbKoE0iD+vAgs4Feiu2PU4KEU/Lk8dU3I0jDfk4fnsdP7
         Cc88vNqxKVhDyZP8ACw+iid8ZvAxTgEioqBRlvDYEi633fqtmjmvJxUgjkvwm4+Maftd
         otTV8ue5JmmtIS4Es8BgpsbROdUrHq0Fe7jt2BevM2NF16Ty6aktOTSgqE+GGnH73Dt2
         Z3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/x3bOS8+EQ730wvwzViwYAyxSIAy+Gqe4DlDcCBFmac=;
        b=uCxIKY3A9By5h/60MdNliRDRg6QhxNM966FeSLXS0yCK/qM0sWJE25CT3rm+oUMFXh
         K9Ey7pE25/M+z8FLo9d5dFf9YjR5p8OF37Ed5iSd9VJoOdMeK/RMIBGfnp3C1B4wrGcB
         DUxiARd8UsbYztkOCBvJmwdQrLFIa7JlF2JQ1yDJOneD87vP2VAZMKrRnZbec1fNU296
         NaYfKywdUdroSsfCrwuQiyuMCUwcmyC1pPdSmefa27Bb5C2ZhrQWBMVrg3hFs5jRIxUH
         r2xkPVdbltIfWyyS/Awnd9mnqhzGJeFml6robQPWalVPuQVnb3K5RwBwQcRBD4otx6EF
         9e2g==
X-Gm-Message-State: ANhLgQ19To42Z3ILWwdUNfxiYnH+CzMNqB1T15sbehxF/d2k6tWmt/5H
        FOZ9Seh8QwSVOIPsDpBSaQdk77XJay5ADWVbZ4pmPQ==
X-Google-Smtp-Source: ADFU+vsM0JTR3ANUQQsabsuZJsGRykwEGIjqSJXt/IVH98XX9FTs6BBkjNP3H6lsmBa6je9qc6mHr1lZrLe8Agh2tcQ=
X-Received: by 2002:a19:f503:: with SMTP id j3mr8990215lfb.77.1583746146910;
 Mon, 09 Mar 2020 02:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200305182245.9636-1-dev@kresin.me>
In-Reply-To: <20200305182245.9636-1-dev@kresin.me>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Mar 2020 10:28:55 +0100
Message-ID: <CACRpkdbBao6ij4SNDJso2X0q0gbU38PQu0DUtWk+QyV7KW4njA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: falcon: fix syntax error
To:     Mathias Kresin <dev@kresin.me>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 5, 2020 at 7:22 PM Mathias Kresin <dev@kresin.me> wrote:

> Add the missing semicolon after of_node_put to get the file compiled.
>
> Fixes: f17d2f54d36d ("pinctrl: falcon: Add of_node_put() before return")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Mathias Kresin <dev@kresin.me>

Patch applied for fixes with Thomas Ack.

Yours,
Linus Walleij
