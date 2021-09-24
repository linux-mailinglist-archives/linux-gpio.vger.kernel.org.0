Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C08416FC1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 11:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245451AbhIXJ67 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 05:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245454AbhIXJ6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 05:58:51 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB649C061756
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 02:57:18 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id bx4so34080373edb.4
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 02:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PCgz1sXW2cXehxuYSw97DLmB72DUcCsESVIojwNuwVc=;
        b=A/N8TFAw7XunR63r8HzRGmSLXvtMGotUbwMblvnxgFeLZTt7tVtm0lZVyWQW3c1PI9
         nG6uWeZdmlE5ROn/T9Fezvhuqa0SGTvT/FsZyY6Us7+CCy8Udpanjs8SzCdJxmsPWYZI
         tzfK5BG1+AksbazGFzXiAI03m9MUu7/KOBkvZjPr6zKhV5Yo4FyIHma4EyCB+06Ajqw7
         BAA1V2oUP9gIZJJu2KMs8RsUnxmBymS/hac6bmC4RC6N5AV4DWwPqHXdaL5D4+aEE+FJ
         3wX5dVoANpsirJNYNjIwZ7YkZSgFOUFWFcwdsjjtKJ1GT9zvx9mAhJW4s4FlgRgzRDHE
         mfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PCgz1sXW2cXehxuYSw97DLmB72DUcCsESVIojwNuwVc=;
        b=QrMZ4YX5bWo1lgWdj1OCHQ+09z+DMFtu5NACdXd0m8yPEdTogKdqPYGPPgGXqALryW
         R6we2SS+S+YAcclE8DhI2P9kSuu6c+nQZS1f5buY5RqM11tiQXpiO9cAd+WOr3ll62b1
         TcmISzmQShDWR69m1JuTYX8vloDsbgr3bOv/8Tywr8LGmsgRSKq8ewGadX1ynd7E/3d9
         R1Km1hWZ1I6hER/i6pIAVkkqxpjtt6o2eogiczuGuIKDEJpy5i2+TJrjlqNYf5PqUHiq
         F49SRJKItXNfOnPWF8BuY2gBoS93K3aGUtaU7uXHk5tw2CBn6NPIcfsZVQdQhBzhREOE
         TOZQ==
X-Gm-Message-State: AOAM531RAD7/hPvCDgRjp5rCp2HRs7R+AZqkWKj19z5O9bSJ989YsuIP
        vi+JuIGepgadJK9aaA29gdSaXQRCnhbH/wWnExBMFMH/nTQ=
X-Google-Smtp-Source: ABdhPJyxkPPlczvwm7k8n0cLeoorgpeYZrJPH5I2p5EiwOyVWD6BdxdSLwd8d6vVlACcIaYtKFeS4E95X49Vz+J1qPY=
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr4002088edl.60.1632477437418;
 Fri, 24 Sep 2021 02:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
In-Reply-To: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 24 Sep 2021 11:57:06 +0200
Message-ID: <CAMRc=Mewmbqo+y++j4iFEn36NMW3xL7AG9Vd+pLt6-PLE3cn0Q@mail.gmail.com>
Subject: Re: GPIO Bulk Request Problem
To:     Kenneth Sloat <ksloat@designlinxhs.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 22, 2021 at 6:27 PM Kenneth Sloat <ksloat@designlinxhs.com> wro=
te:
>
> Hello,
>
> I am using libgpiod v1.4.1 and am having trouble using a bulk request of =
gpio lines as outputs from a chip. I am using the C++ bindings. I have conf=
irmed that I can individually request lines and set them as expected. Howev=
er, if I use the bulk request, while I get the expected number of lines (an=
d defaulted value is set correctly), iterating through them (with array ope=
rator in this case) and trying to set the values is not working as expected=
. I find that for every index/position, line 0 is the one being toggled.
>
> A simple example is below:
>
>     gpiod::chip *mychip;
>
>     mychip =3D new gpiod::chip("1");

Why would you need to allocate it with new?

>
>     gpiod::line_bulk lines =3D mychip->get_all_lines();
>     lines.request({std::string("gpio-test"),
>         gpiod::line_request::DIRECTION_OUTPUT, 0});
>
>     for (unsigned int i =3D 0; i < lines.size(); i++) {
>         printf("Set line %d\n", i);
>         lines[i].set_value(1);
>         usleep(1000 * 1000);
>         printf("Clear line %d\n", i);
>         lines[i].set_value(0);
>         usleep(1000 * 1000);
>         printf("\n");
>     }
>
>     return 0;
>
> Not sure if this is a usage problem on my part or an actual issue.
>

I'll see if I can confirm the behavior here but it looks like a bug indeed.

Bart

> Thanks
>
> Sincerely,
> Ken Sloat
