Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D21D0AAD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 11:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730398AbfJIJNG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 05:13:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40801 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJIJNG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 05:13:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id d17so1067182lfa.7
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K78KklRog9ZZ5Yt/jTADpXsNBCoM5afXm2vhqmnA4XA=;
        b=YCR1uF5O0YeHaczq1oGjKyFOMgQl8W+XqfD8/pIZuPqSpsLclBdC6AoaBAB2hN54uY
         +bcUtbS/CqiQadb8OPyseWPFUC1X7A/6hqYKmW4Gx8KYNPbTFCgalKjKi4Qdvj012Z4f
         2YkaxQtEiNsLu9tDvCUvphFtvI+J719sgIRf2CwrRNo4r7kb9TmuQkq6kvfQlZ2M6rtl
         UzascCi0mh1Ifq9dVtCSjECY5iJyM/ULA3tcpspB3BosT3Hu8n2TBXTwncXSxUwWazAx
         jzKAD2Dq6zo2XuRXVFEoyWs4P2+Z6E4Eu3DuCZYETPBIyBz4qfy+YIHlT7x+3UpvSpWr
         sUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K78KklRog9ZZ5Yt/jTADpXsNBCoM5afXm2vhqmnA4XA=;
        b=ahgqZ+nJGKMamwrUCxtofyElHyysdkveyqiqaQC6GIUMCNJydiV8PfLXSS9KKXj3EU
         T1sKJzqM/c4EcdB8pKCCGn/b0JN4ZA/gMNWymkb6SA/5ACItDe+3Jh21OhGg6vj0T3uZ
         k3r5qCWcAzfz4kIb5qpBkbuOrb8N3c2WULtSWezOEW3R7J0adGAbCSUfYS7ZZMJu573T
         p2tqsDtIFiNRE/h2JBqEZUjAxAtIROF+1U78EBoO3AStZ1HLyuv7KRHAWu8E/Y+CuqxM
         R9IhYNewMmKGZxfW+rsuFi4qrwiYtJnbCLchdLJPDQEdXwni82CTDwYCRHAUeoUmF/t5
         QRhQ==
X-Gm-Message-State: APjAAAX5TVLkq5qoAN5ExRCH07+v3t2Y7EO2XSX6XaB8VkNWgBaSPBdn
        VG5YfnLRlhri5cSNjZ3AAQRFDhf5CznVfhxxaKtuRw==
X-Google-Smtp-Source: APXvYqxXSWot6LGbQcOddq5DeyXe6rXtpVH58kxOqwEXgboUiUy3V3ANm6291Eeup+zLJtZxza772BxT8V0iNc+6RXs=
X-Received: by 2002:a19:c505:: with SMTP id w5mr1408110lfe.115.1570612384646;
 Wed, 09 Oct 2019 02:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191004164059.10397-1-j.neuschaefer@gmx.net>
In-Reply-To: <20191004164059.10397-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 11:12:52 +0200
Message-ID: <CACRpkdYBfmK0nb3m-RXbnSfCKHY5j2Fns2P8iiAUjN1qO8TruQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: driver-api: Move bt8xxgpio to the gpio directory
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Michael Buesch <m@bues.ch>, Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2019 at 6:41 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Let's declutter Documentation/driver-api a bit.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied.

Yours,
Linus Walleij
