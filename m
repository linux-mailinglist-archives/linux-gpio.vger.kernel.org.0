Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8421DEB65
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 17:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730188AbgEVPCf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 11:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730307AbgEVPCc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 May 2020 11:02:32 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30145C05BD43
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2020 08:02:32 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 190so11041236qki.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2020 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dkxEj1coOfFtDRdGk3SHlsiZ4KhnaU7casF53YxwhU0=;
        b=Q68AtwCbz8IXixg1Uv4JuWkQ/dS2CfBaNQlV3gMnByIVeI6j/GvmAfME+iKXxJ0KDB
         nnwMs2C8RhJ/lGobWxPffVUcGTzVwRhI7bmIinrBQIVwE9PD+hwyBH1MQ1mIlG1o0Lrg
         k3yKlXRa7zUNA0osoCCV4GAbD6XdNd/IkBBOM/gWIhTs7azCEzkx0yi6NwlLwffLOoyW
         twVYFHZ46gAUn6FmFpdhPIMPjv4OzLlyHosrBX+kmE3Gj4sNZO2VCnjV+CL2ad69b4Z4
         9VxRkUDHFjzarPLdcJ8I7fWevXAwuekDxAXylXfy2NuO4ZpDcWL4KKk5l7VuwWNI8tl6
         fCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dkxEj1coOfFtDRdGk3SHlsiZ4KhnaU7casF53YxwhU0=;
        b=pAbQheKlM3RSGekKN5owvfplDHHly7aEuKV5W3SgXw9SrHflUMZpPyRb9QzY0FalRm
         o8svZTALhL7kPsG0M+rw/asO1B4Id4k60iHkzYwRT9EIbBpKdvpU+rWujf0e6XUHk3FF
         Kg5q9nYzUmEBEwRoti7/eKOCRyR40ttiPAXyKO9Zsl+fSxEVDP6aQ2QmI4daNNIuKFoN
         37EYVacDeS1M9HuaPAb5ALKG4rF8JRUVvZ2HyaoIFn0v94C2oX8KzGh/DO/WuqKrsPGb
         YQ4sYx+Nb1oExq6mayIj6TGdIaK9PpbpsXL2+M2GHejSTtHnRiirhEow/nisVqa6gI80
         4Vcg==
X-Gm-Message-State: AOAM531YZ/z3htoftYFdXmm+fx3bmJM5NeqViWKoAoJrBAtqWylAAfGk
        GghhYQRtkA24PL/FBwest2V5aJnQAaUnrV+4uA7g4gk0
X-Google-Smtp-Source: ABdhPJxePnh+DCaZ9Lz/G9eTquabOUYZMu3bEyC+yNH7arwpZItl5eI97xafp7tSps5d0QkUa/ya6COnAk8O0yMuNic=
X-Received: by 2002:a05:620a:6bc:: with SMTP id i28mr15831334qkh.330.1590159751249;
 Fri, 22 May 2020 08:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <1589461212-27357-1-git-send-email-alencar.fmce@imbel.gov.br>
In-Reply-To: <1589461212-27357-1-git-send-email-alencar.fmce@imbel.gov.br>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 May 2020 17:02:19 +0200
Message-ID: <CAMpxmJXwS21ByzGTsZf6MC-ar-ajUeCCxzP-vNrBEWSLKD9+sw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-max730x: bring gpiochip_add_data after port config
To:     Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rodrigo Alencar <alencar.fmce@imbel.gov.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 14 maj 2020 o 15:00 Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> napisa=C5=82(a):
>
> gpiochip_add_data being called before might cause premature calls of
> the gpiochip operations before the port_config values are initialized,
> which would possibily write zeros to port gonfiguration registers,
> an operation not allowed. For example, if there are gpio-hog nodes
> in a device-tree, the sequence of function calls are performed
>
> gpiochip_add_data
> of_gpiochip_add
> of_gpiochip_scan_gpios
> of_gpiochip_add_hog
> gpiod_hog
> gpiochip_request_own_desc
> gpiod_configure_flags
> gpiod_direction_output/gpiod_direction_input
>
> which would call later the gpiochip operation direction_output or
> direction_input prior the port_config[] initialization.
>
> Moreover, gpiochip_get_data is replaced by the container_of macro
> inside the gpiochip operations, which would allow the calling of
> max7301_direction_input prior to gpiochip_add_data
>
> Signed-off-by: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>

Applied with some tweaks to the commit message.

Bartosz
