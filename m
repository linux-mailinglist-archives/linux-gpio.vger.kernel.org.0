Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4132388E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 May 2019 15:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731572AbfETNpN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 May 2019 09:45:13 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39862 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730395AbfETNpN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 May 2019 09:45:13 -0400
Received: by mail-oi1-f196.google.com with SMTP id v2so10002907oie.6
        for <linux-gpio@vger.kernel.org>; Mon, 20 May 2019 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kqURiR/ZjyppefNcyX5bQaLFCGWHT5UVZFYxqgSVTZw=;
        b=vs+n4SXrFdjiRJrJJopSLdFRgVKJfYsQwIKMGsBnVGq1DzPvgdlpPQNimjSQ148cSh
         oFKtSVy0eETOEdCQqmbxKrGEABnsH00MqCDdwPHYLVuTz0kSZm5m0lGrliV7T+yHTlPn
         5EwDd4kTAb9VYXF3gEWtwOXsIy4sYXtCXO/3EDri4OVco/8F00vtwuJoufSTYEhLr+Kr
         ytnup/5tobCHle8fyrmxv6LHfB7wx9ZFkMRo5XGGxnHyLfphTh4mglt/VHuHmrdiPk7X
         jPVuhF38AX+aa4R0C/6BrMgr5Jc4kom2Goz+cp5nZO/b7FfSXubcZxczK7ML/4k7j1JF
         OH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kqURiR/ZjyppefNcyX5bQaLFCGWHT5UVZFYxqgSVTZw=;
        b=MIY1vAtQ+xXygsnv2QaSQ87dWtGNihC8bfQHrF1N05Cep2R7rv3fCPnDZCEvBNSPj0
         9E2WWP+z3N0gLQFpBYlA47FgitDy8XcAtnMpke641LdBhSInGpKe6n4L78Mh6CcZYbmb
         3k4dGTZrUUyQqKR/+HYKeiYgNGe4+TavHyPXzilZFiit6SMkfvGXiT23iADSPKvuCmJ9
         QmMgYJEwpNZepMmT0Ix8b2Bz6iaaytSlbdlKnANOyIvFz8MMfeH0ULLzswiaRUzfPd2y
         8XI7EGoWI7WP2PeDMldNQIHml/FjzJFzSqe2C3c+F93JknMggUyf1u+cm6oZMPITKk7Y
         dsSw==
X-Gm-Message-State: APjAAAV65l2fl3UPEXUtTeaq6RtVpdtTGbpTD/VRf/GLc/CSt6MBsm6a
        fzOrQc7NhehMf89x/I/eC6yuxI1LTb7apXeeUWHAsA==
X-Google-Smtp-Source: APXvYqxGGltCQQkhfd8FsZcR/NEGWHLEa2/5JhNm18lEoFi4cG/57tQCWQc5D/9C2mlMQ6tMhCidUr1+oWZhjww0AM4=
X-Received: by 2002:aca:aa48:: with SMTP id t69mr9852670oie.114.1558359912040;
 Mon, 20 May 2019 06:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
In-Reply-To: <20190512053749.7508-1-skunberg.kelsey@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 20 May 2019 15:45:01 +0200
Message-ID: <CAMpxmJWCD0yOTyEfQhU59BsvnUoGkwWC3cEnS8Dn9W7EupA2Wg@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: Add include/linux/gpio.h to .gitignore
To:     Kelsey Skunberg <skunberg.kelsey@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 12 maj 2019 o 07:38 Kelsey Skunberg
<skunberg.kelsey@gmail.com> napisa=C5=82(a):
>
> File include/linux/gpio.h is generated after building
> tools/testing/selftests
>
> Add gpio.h to .gitignore to help clean up working tree status.
>
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
> ---
>  tools/gpio/.gitignore | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/.gitignore b/tools/gpio/.gitignore
> index 9e9dd4b681b2..a94c0e83b209 100644
> --- a/tools/gpio/.gitignore
> +++ b/tools/gpio/.gitignore
> @@ -1,4 +1,4 @@
>  gpio-event-mon
>  gpio-hammer
>  lsgpio
> -
> +include/linux/gpio.h
> --
> 2.20.1
>

Patch applied, thanks!

Bartosz
