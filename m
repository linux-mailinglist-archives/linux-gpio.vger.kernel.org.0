Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2213DAF94D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 11:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfIKJom (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 05:44:42 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40489 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfIKJom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 05:44:42 -0400
Received: by mail-lj1-f193.google.com with SMTP id 7so19319767ljw.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TfO4HK/WGXxXK4b73oCZUUTA55lR9Dm1uUKXZY75m1g=;
        b=FVd794B/Kh/woVfXGPNZCcWRpdvtsO7FEOFvVWWsDu9CYn3LPtCumsPuml8fSoKw+e
         KnKQ1OQBqXFQg6aAxPWZ9HUGhtvWVXE2oMkqx/P0c4YZ5Dr+VfmnJTgVQP/TupXCVAgd
         PSXqaZfRWqeyTLoKB2ClqNXo0wsisp9NfhfloqBp6KpkJstC4JydH0EqgRt0bq0sqtGb
         UtIxjI9Qxd/S9sWFfStjHiOq9R0mDh75ID1sH9qF6T9BmL7AkK+TJsEKb9iUw2WSAj2X
         ky1GT9TVT4NlNp7nUobvtpK89c2PzAxwlBYSGimYJTckgwGmIvYBAvMsoseCkdXWoyUJ
         GvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TfO4HK/WGXxXK4b73oCZUUTA55lR9Dm1uUKXZY75m1g=;
        b=odjBgd1F9jsDRpWK/Cezpiqt73rRdN/Xbs1grJyp0dB4bk1bhYN9P2QrmhQWXYqkh4
         q38kc/1COptVB4dZZDYB403vFmVhxpqWydJTAmDRcWacuIFiPEABcoC0vYhmKoZY3wns
         xVMeOlutpPWNdOg2pOUBAGwLCGg8a365LjW7Y1eczBSNsIQB154kI4iSxoGYUSgqEd+S
         5nOL+vXmRJ4v/Bdqg6AoyCqcdxu7VkyxyYEbyEc+bSK6+oVKLteN/PoEBcmO4rdNqZo1
         mA6r3eH3Qmp6ZKqbHOc7iaCcQBKSW8+E9j30utTcFgv2kKhvrP5BCdBeWsXkSxJdKtWL
         igFw==
X-Gm-Message-State: APjAAAVJfiYg+PixL2eK5oil8nF4fhaQ2rN5lV0nfCMicLmzTtwzmL3H
        JLXm6uEecWWG6iIukuKWc016YBDp+Z2H8JsP8w/PuQ==
X-Google-Smtp-Source: APXvYqyeJkEnPdU1nrHqRvNcYPbtI5tOlybw7foaIzX3I439oYmaNxLFkKhZDLyK6wH/rgo0lItiJsUi9kMI/EVGZhQ=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr17545242ljg.69.1568195078811;
 Wed, 11 Sep 2019 02:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <1568178685-30738-1-git-send-email-rayagonda.kokatanur@broadcom.com>
In-Reply-To: <1568178685-30738-1-git-send-email-rayagonda.kokatanur@broadcom.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 10:44:27 +0100
Message-ID: <CACRpkdYSHnt3WMjpukHKq0kygxZbxHt8tipkQ-UHdXWYr0L5yg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: iproc: Add 'get_direction' support
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 6:16 AM Rayagonda Kokatanur
<rayagonda.kokatanur@broadcom.com> wrote:

> Add 'get_direction' support to the iProc GPIO driver.
>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Patch applied, thanks for doing this!

Yours,
Linus Walleij
