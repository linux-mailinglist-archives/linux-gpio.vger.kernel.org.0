Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C87F1EF71A
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 14:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgFEMOv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 08:14:51 -0400
Received: from mout.web.de ([212.227.15.3]:33265 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgFEMOu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 08:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1591359280;
        bh=/nzgNVDapogStYC4Kd6Z/LOu+25vbppN0v9dHj6Ug+A=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=TKC8orgMj4Pp34GgM/S443+obChISHIz0u0Osx8GUBtM6d+JJfhj0bowZwyJOf8H7
         V4l1/5ixwderxabrN0cY3D0DVqJaN00U0ids6SecXNwZN5b6zvgdXcbkQLxJcMB9cq
         B0T0qUmUp3z0l6cnpTiCPEv112dGCpak/9xGl+dA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.102.114]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MECGX-1jrJa90cpp-00AHn0; Fri, 05
 Jun 2020 14:14:40 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: arizona: put pm_runtime in case of failure
From:   Markus Elfring <Markus.Elfring@web.de>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        linux-gpio@vger.kernel.org, patches@opensource.cirrus.com
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <11488e76-2ea0-6478-0800-deb0438f0136@web.de>
Date:   Fri, 5 Jun 2020 14:14:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6vze/OLGnmlvoSaFdiaCTVS/d1roKImYO4mfkKOKPFz4KqQl08q
 9ydU87XJWcNLTz0vJtSqqRTlH62bmLE5yjnO9kP9ZvZ1T1w1PHztWWvLnXpivoY8FacUCIs
 pFXm0f9kdPg4qaE/GPBNX1EeG/f2p/QmWjrCH7WDaY/uuTwAYLJbPmO758Lwlx/TsXJE+zf
 2Z2jZiL5c10+U5h4rjmww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qODrcmCG6+U=:dIjks5CvDYqda0CldpWLJe
 36LedYb7GvvP4HQfoQRqYGjVXRBtbhLbytfo8qHYtUcZpB+OobQOd06gxPCg+x8KCxaeWJeQS
 7VFz8qDfqZyVJoZPTMnpaoaJrXh5SH8MAgbyIQRGgkVC7vYXjjFYKGMSdRvAufiFQMV5auj6e
 ai1qld9YP2Z+9DZnkLbX7fXjnKflDJ5sZ3WrOXVVpRyAs1r41Z9aG9MYyTmMLpxtXiy/6hCSz
 E1olEIvx+LxigngU+hZxgGjj28Dh4Q5nF4gQRnhhb3bnqQgsjMfw3gFBGmcGp4tPrtaiGkbiz
 0nv5WUp2Rm9euu6CquY0r00QSCdSAHLVDGRaWIU0xzFSYiXJW/rCrHzMkPOOS3n2x68N0Uiv8
 t1nq6buAnDebKI/qNCMEcQfoLspawhJaxskuNFUk1+zL1gifLCAqfCqqzxGGHk9y/qtNu+0pd
 W3x96kzA54uyQNFWemLdn1R2kjJQY9jXW9jz8WkFfIJGTSb5LqK+DcjBQFB9rc7XCsbpLaG31
 iwvhMLS5RQwzQk/IgB/0/n8dEaO2jJf2wKbbOmTNTgat5jq748xng7ZrXrya888H/6jh0TlXv
 9opDwNPYsk6vI4ydib4rKIeyna31raGP5o9jF4uQ5XXzpK4pyOwOVUjwAbvLG2m2/8tydh1R5
 lfgcjW/fE7CJwgZ0csMAExstMaKMuBaStnGRC7r5glaiSOOmCXGG1aFUBjATWLTbGEv957+hq
 g3n/tjCcH+Z/SQpPAPFn8/ps1VkpJ3IHjI7bT7ufAFoyhEQwJDpoWu4U8b2jirMaUbOb1ZUbS
 +L6hW5MUjeO/nvEM1vAJ3Pw5kMFvFFvNHxctTc9rGB1R0BK19gHKOrENBJW5DirelSfDRBrk6
 2buHdvh47LEuiuoEwnczWmWr2GRmgsSwhrcaFUQQvT3lns3cYfOApgtPVnumqAZD1wnjx9XAn
 pMYxAJPwksjOdPEqV0tiip3hC82uC/1l1Iwvy+2qzj8dqEoqDpI6qu/yro6+WbbJHt12J6fZv
 jWDHLz8519hF/wmXXhBGsQELRImryGx5BHmhr+pKZHqMfwM7iYg/oO+9UQ941R/nCUe6ng9gh
 VoOXMxAHS8HqhaIh6qWkEXAQdPtxQWTbWdV7TudKbKTKGeLxPX9TV77ceARP42gwd1rTndy1n
 xadSYQ36BnSbgn2LbbZHFrvNf6NvgeMOWAdtmQT5OpYiMszIPa+Ar9YpcujEwDdyxdbqPp+s1
 XvEzqO/+qdnm3wJa3
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I recommend to replace the word =E2=80=9Cpm_runtime=E2=80=9D by the
alternative =E2=80=9CPM run time system=E2=80=9D in the patch subject.


> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths.

Should the term =E2=80=9Creference count=E2=80=9D be used here?


> Call pm_runtime_put if pm_runtime_get_sync fails.

The diff hunks show an other function name.


=E2=80=A6
> +++ b/drivers/gpio/gpio-arizona.c
> @@ -64,6 +64,7 @@  static int arizona_gpio_get(struct gpio_chip *chip, u=
nsigned offset)
>  		ret =3D pm_runtime_get_sync(chip->parent);
>  		if (ret < 0) {
>  			dev_err(chip->parent, "Failed to resume: %d\n", ret);
> +			pm_runtime_put_autosuspend(chip->parent);
>  			return ret;
>  		}

You propose to use identical statements in three if branches.
Please add a corresponding jump target for better exception handling.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?id=3D435faf5c218a47fd6258187f62d9bb10=
09717896#n455


Would you like to add the tag =E2=80=9CFixes=E2=80=9D to the commit messag=
e?


I find it amazing how many questionable implementation details
you pointed out recently.
Were these contributions triggered by an evolving source code analysis
tool like CheQ?
https://github.com/umnsec/cheq/

Regards,
Markus
