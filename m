Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CC56536A
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jul 2019 11:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727595AbfGKJCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 05:02:33 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:44035 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfGKJCc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jul 2019 05:02:32 -0400
Received: by mail-io1-f52.google.com with SMTP id s7so10843593iob.11
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jul 2019 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=go/0XC3yz6vXoIDJ0RdfnfND3LfeW+PuAbJVbQvJ66I=;
        b=vC6FoYFjyiZnqlIk3ar5Wsda7HD/xsJNN5B4x52uQRtM/shfVNF+m5nlk0/zaw9taZ
         3P6odZWCwdqgvVOmiSH6vwNkmd/KYyDcr7hznFDqB/280pwIui95rCgzfiJYldTzbuwV
         7QAJpFACYCA8VQwTmHMduhmLNWZsw4nPeaM3caUtR8pHHlGk7kICPCIkQAJ8RqAR9PZr
         3FMQfBPKdeCnH/hIuN0hyezzBMPJ3PNEnKKuBiO47ExM02bU1qbHRJ0Udd+szRzrgtu2
         NkUMdJSKX4WA331xX6qlBQPtzIhGCguVDWVfZbP/ARV/0jkdaL8btzh8q9wPWdsGnBtH
         bhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=go/0XC3yz6vXoIDJ0RdfnfND3LfeW+PuAbJVbQvJ66I=;
        b=nuJD5+FqSwfgbTqVRkE/h/OBleyNd6tJYxW92e68V+cQ7QeJDicKH1voZOaw2iRRyV
         gUN0CkGfF7TlHYLscwr2ICPmq7Ow1I56Qk818Be6TnPVc/9ldkS3p9GFQZpMAVPlovaH
         ZaRAMoJkHvHw89AVhtbAz4KOg4SoeLlF1X4w0Jz0tzOgc69HjidALZdf+ea7lKWcjPyl
         S6u6Ihy8AkSV/fiYO6NwTp7lO7GiRAEtfmImc8uMzSh83p043NYvPajem4N/lVjAFv8f
         i8AfclMdmVy/MatOr8PxvwkZj/Bqq7QoJXKD+zgND0GLShejFBDCB7pG78Dz4N1U2eSr
         03ZA==
X-Gm-Message-State: APjAAAWZbnxs9Lh+26EYUXAvNQtrDrqHtZNF6tmB/6nvuc8lpyAKFqSN
        ByXeyBy68fxRWnfpACgwyQzJwWJbgeBnNSPhRDPbiQ==
X-Google-Smtp-Source: APXvYqwBMSdVvu8RT/aHrXAKN1JZW5D7unl0V4pBKZcQ/Gj2jfB+n2QZTPMJmf5EbLWNNDGon1H6Kb4H+QatEUHM+fU=
X-Received: by 2002:a02:cc6c:: with SMTP id j12mr3176494jaq.102.1562835751603;
 Thu, 11 Jul 2019 02:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR13MB2532728B9B6D7E73875DFCF1DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
 <BN7PR13MB25322B3D67DFC0E8787E79C6DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
In-Reply-To: <BN7PR13MB25322B3D67DFC0E8787E79C6DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 Jul 2019 11:02:20 +0200
Message-ID: <CAMRc=MdzA7pkT8=uEymLizoRSQnB4bNpbW4DG-HfADhgVthUiw@mail.gmail.com>
Subject: Re: [libgpiod]
To:     Kevin Welsh <kwelsh@welshtechnologies.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 3 cze 2019 o 14:24 Kevin Welsh <kwelsh@welshtechnologies.com> napisa=
=C5=82(a):
>
> I am trying to make gpiomon into a daemon using busybox. (start-stop-daem=
on -b) Instead of writing a message to stdout, I need it to execute a scrip=
t. My use case is that I need a button press (gpio) to undo setting a stati=
c IP.
>
> If I set - -format=3D"touch buttton-was-pressed|sh"
>
> Is this a valid command to make into a daemon? If not, can I submit a pat=
ch to include a parameter for executing a script?

Hi Kevin,

I didn't see this message because you didn't Cc me personally.

Yes your example would work i.e. gpiomon would print this string on a
GPIO event. Executing scripts is on my TODO list, but your
contribution will be more than welcome. :)

Best regards,
Bartosz Golaszewski
