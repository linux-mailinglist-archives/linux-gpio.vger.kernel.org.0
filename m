Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB01482458
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Dec 2021 15:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhLaOhB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Dec 2021 09:37:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhLaOhA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Dec 2021 09:37:00 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A1AC061574
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 06:37:00 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id y13-20020a4a9c0d000000b002da7c495563so8791369ooj.10
        for <linux-gpio@vger.kernel.org>; Fri, 31 Dec 2021 06:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=JXeFOPyTrDaAFJ+vTz4fcec9DEXgQySzBIYKKZ5A61E=;
        b=RB4YnNLjOKqR6XhMlYRY9T7IZzORf1xRUN6EitZFMh8cDVctt4dUXxIuYWkkTiAgK3
         tzY6YR89s8PH0qKzrdwDODdKwagHcHjee6+7Yv9MeCmt1EHdJw4dunBqmy3jwCiMxYw2
         NDrJblXqtXl4WfgiISjQS96/XX+d63bOd4WImtzJjQhX0rrhu+q85Dwg55ex9dGU+DcA
         jggTKgVuat76SNX+Hb62zoyEA4YRp8rVz4yKYBz7ksoSWJokI4deEfjXygQmvziZr5zx
         ItmCX9k3QnG2znIszrIp7h9MliTL8qRezn+fhdVy43KwhW6zTZdFHslp2TbFXLib5Bqd
         UdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=JXeFOPyTrDaAFJ+vTz4fcec9DEXgQySzBIYKKZ5A61E=;
        b=K32B3j9R+ff7jqHimlcOogQF9nAn6exBzvmJKhdpDXlJY4iIdNRlv3ijASzuwBYxLm
         5Jisxvp45z67jz/TSmc1Nd1NHILT7KpXrzFDhd1T3ULKtbOu3pg12wz8xmqnFQ+kWT0t
         hypGjRlSxnCTLdZ1/tuaYwr7NBGr2zXTW/kcd9MmUPuGKyrZjkEIp4LQQAmhPjYkrV3z
         dOCshqA1pHEMB3/AkrRdLZ7rWQZqt5I8sG0C7cJ5w8BWSgm7coWpYQW9iYHfmvPVqOOh
         gSQ3sCBeZYwuzmsr1QFCm5rza4aZfla/P7kPpPjzrKEyTCEWTi+KX5bGjz4Ys9NEnhpL
         UDzg==
X-Gm-Message-State: AOAM532h8eIusk5tpkBVD0WdikORJt0VHV3fDf9ghbz9DxYNSZvCnz3y
        6OQ/IreqMz1zeCHote9rJPGihPSYkzfzktdFPqV9AgyZQVo=
X-Google-Smtp-Source: ABdhPJwi0iFH208fM2OaoLfUEIaskgVToKROczYXNY6gVBC1wooqsIrvgmio8969gEJCa8ADoe5KNRILWLP9fmzGQWs=
X-Received: by 2002:a9d:7987:: with SMTP id h7mr25634088otm.60.1640960924252;
 Fri, 31 Dec 2021 06:28:44 -0800 (PST)
MIME-Version: 1.0
Sender: hgghghhjhghg06@gmail.com
Received: by 2002:a05:6838:8394:0:0:0:0 with HTTP; Fri, 31 Dec 2021 06:28:43
 -0800 (PST)
From:   Mrs Carlsen monika <carlsen.monika@gmail.com>
Date:   Fri, 31 Dec 2021 15:28:43 +0100
X-Google-Sender-Auth: lYY3p5qtMjRefXrpv4dQNT9-DMM
Message-ID: <CALjxKU7ZS7cSkitQvMyjvuV=QGhseLQ=5Bp675qbfx_M=YytSA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

  I sent this mail praying it will found you in a good condition of
health,since I myself are in a very critical health condition in which
I sleep every night without knowing if I may be alive to see the next
day.am Mrs.Monika John Carlsen,wife of late Mr John Carlsen, a widow
suffering from long time illness.I have some funds I inherited from my
late husband,the sum of($11.000.000,eleven million dollars) my Doctor
told me recently that I have serious sickness  which is cancer
problem.What disturbs me most is my stroke sickness.Having known my
condition,I decided to donate this fund to a good person that will
utilize it the way am going to instruct herein.I need a very honest
and God fearing person who can claim this money and use it for Charity
works,for orphanages,widows and also build schools for less privileges
that will be named after my late husband if possible and to promote
the word of God and the effort that the house of God is maintained.

  I do not want a situation where this money will be used in an
ungodly manner.That's why am taking this decision.am not afraid of
death so I know where am going.I accept this decision because I do not
have any child who will inherit this money after I die.Please I want
your sincerely and urgent answer to know if you will be able to
execute this project,and I will give you more information on how the
fund will be transferred to your bank account.am waiting for your
reply.

Best Regards,
Mrs.Monika John Carlsen
