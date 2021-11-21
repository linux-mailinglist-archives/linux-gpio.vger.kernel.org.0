Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FD34586E3
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Nov 2021 23:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhKUXBT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhKUXBT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:01:19 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9A6C06173E
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:58:13 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id r26so34192428oiw.5
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 14:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/5OZU0dPITJ79B0ldHvptsJJjqxj5kJ42lpkT+u7EAE=;
        b=dnSoV/tSD+rfrE9UnR0LqWTICHhNjqERhGtexoeub25ZTDwZbCaePnvxpiyrmLQnW5
         oRjynhxCJKKJWK12DJMB6oF6WhnngL5V+F9GvAQlIgDz4aVHqo0Lbg2vFjtwIi+XrHzJ
         Tnji7disVwfdrSyVd/BphgXXA0tR4CI86OmfFowviZFLOAKQnt6xiaLO9zl7BbDrN6Ri
         y4VPAsYFAmPVyea7JCLuALUcewsNt4WwpBQJ5kAallC7q6ySyLiEr5nqdy7Rp9NUCoDO
         eLiom8oxJngJefdNG2Dlx4f8S8S9GBng8O+3QOlVZh/UZoWgXy3P/l5KcflHjgLyRApS
         6xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/5OZU0dPITJ79B0ldHvptsJJjqxj5kJ42lpkT+u7EAE=;
        b=PC3OFe+sB43JzZK+FvHGARbykhdgl0OKqkFznFH/fwzY45z+a2mj82hl4b9VPqfH0E
         W4DmP+vHotFbYf4ZgdPEF9gDyZ0RqNlcm4DVBpuilv8Z9UgL6M7FMTGXnpmktmBVND/N
         ADZvMlz8H1i8b+NIGbJ8DyDQdO54ecgm7lGK5vvSAJNp7LfI3elRCksy26DqDg71VNKL
         sJPV5kV5yAb5gzU3kmGehG4dNNvxRg7gmjEdRk4HVmkfqBSZf/FZ16x0PrHWnO6a5Md5
         PI1GZ+VWEUcEr8aAWtF4njzbxSz16ji4V6FJF5eEHa6n7XdH+I298YpRlwN3Rivikl1j
         OFTA==
X-Gm-Message-State: AOAM531oc1wrGvGCglHgUxTSvTlNVqQre9e4A24YwJXGI0TZ+REuFwNu
        /5JvCZxefjbmcnFPF5PQbPvej0USjoAwPP19M6Wrjg==
X-Google-Smtp-Source: ABdhPJyVeByS26CUTL6DtZHU3tOXB2fRzb6opZhfyZVeuemgt5Kvq+XhBTiDAtDzxeTbOO6EexIMaBes3AiawHPQtzw=
X-Received: by 2002:a54:4791:: with SMTP id o17mr17766392oic.114.1637535493362;
 Sun, 21 Nov 2021 14:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20211110165720.30242-1-zajec5@gmail.com> <20211110165720.30242-2-zajec5@gmail.com>
In-Reply-To: <20211110165720.30242-2-zajec5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 21 Nov 2021 23:58:01 +0100
Message-ID: <CACRpkdbfMFa9wt2XqhzK6-ZbAgRPPu3C7o2=4PbK2FEYFgkJ2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: use pinctrl.yaml
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 5:57 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Also fix some examples to avoid warnings like:
> brcm,ns-pinmux.example.dt.yaml: pin-controller@1800c1c0: $nodename:0: 'pi=
n-controller@1800c1c0' does not match '^pinctrl|pinmux@[0-9a-f]+$'
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Looks good to me, Rob?

Yours,
Linus Walleij
