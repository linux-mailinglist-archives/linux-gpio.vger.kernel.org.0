Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B83044D9A2
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 16:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhKKP6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 10:58:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbhKKP6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 10:58:43 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3377FC061766
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 07:55:54 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id g17so16066361ybe.13
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 07:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=dUEBJ8s60r9R+Twr3VQpm7H5zgORXjeHPo/1ER1vvro=;
        b=JQJl2NH/4iAf7i8A82vx7JiOJJtydg2OYeDnyM12ksvYx0gwtruNyte5zjEPyOCmHk
         xTxSftAvC1IMK3d/6BYzMqMUpxevc6STW53MzT8U3+mHNzY8RwO2nsePktSdo9XVvJnM
         P5XDHCKYkzO9zJ8PeSEe2MsH90n0XYmmBcqXnuIZ4Cn5+Fdgxy9YM0xD/0keW4cupzWH
         vHf9W0/ZGh3ayWMy4b2QpdQ+qRN3UweQHstYs8LbLVUgpG7PvfndhiYJLH+IEl8/hHR+
         BlPvi+4bPmRfECBxZoUrLVEYeXNm9fK0U7GRToRkxsGD7EGDHQbiEEfZrIRBDpJAq5xw
         zDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dUEBJ8s60r9R+Twr3VQpm7H5zgORXjeHPo/1ER1vvro=;
        b=n5SX2opKOpfPWlGgDbDM3vrYvDJbM0biZ3RAgcRBhJXr0eXHUhazUnnSm+g+9VQ0LC
         hLFNQ1hG/KLAPZEU5LaTMdGdXRJj3sF7WUYAsAK3/7jTKdarGY+eCRQaFh6GH7C0wC9J
         buKiAliJNEIA6zhiq96To8iZtG7+nLUXmlev4osP72ADyLlhcSf33T2tuiNsTk5bVK4n
         NmaxBNwphR9q0NddvtJSfmIyBwZVNcnHvWjGI02YDLDGVQWmNRv4qbwbKEAIKXGgZDn4
         VFPnwaBJE/F7VK0gCOyuixYchP3Q3D86gKJOPQmHtd/9/7QqfxoQeFwwDNovEc4Dr5yG
         Ch6A==
X-Gm-Message-State: AOAM531ENxd2IsVlfyg1XkVI/X2p6ZgEYhr+c3wzYMe7RaZi93PZC/Y+
        6jE1PFvRd0pKgGVc+yvOd9mBM2RFDQAIPMlRkSttL6CQzA==
X-Google-Smtp-Source: ABdhPJwfTlxsICpK3nytKzt4l9p5g40MBWrj6guNFSeLB9hYTd08QAml4Ks7FnJLCGsHO7TqiH7zvKr5IbhHfBN/b64=
X-Received: by 2002:a25:44c3:: with SMTP id r186mr9151500yba.130.1636646153296;
 Thu, 11 Nov 2021 07:55:53 -0800 (PST)
MIME-Version: 1.0
From:   Thomas Williams <thomas.hugo.williams@gmail.com>
Date:   Thu, 11 Nov 2021 15:55:42 +0000
Message-ID: <CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com>
Subject: Confused as to what is going on with libgpiod v2
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry, horribly newbie questions and if I should be asking it
somewhere else then please tell me.

1. Have there been any releases of libgpiod v2 ? I can't see any tags
in the git repo later than v1.6.

2. What branch is libgpiod v2 development occurring on ? I'm guessing
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/libgpiod-2.0
but the last thing there is a huge change-set marked WIP that doesn't
seem to fit with the previous practice of smaller change-sets (NOT A
CRITICISM).

3. What is this branch:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/log/?h=next/post-libgpiod-2.0
?

4. Should I even be trying to use libgpiod v2 yet ?

Best wishes,

Tom Williams
