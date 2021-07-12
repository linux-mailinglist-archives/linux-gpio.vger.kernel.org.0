Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1AE3C6547
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 23:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhGLVLb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 17:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhGLVLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 17:11:31 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D89C0613DD
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jul 2021 14:08:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id l1so8271522edr.11
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jul 2021 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=R/dZ70tU/TxD2s4cM/VW4rskmb0fFyi+OQcBpX2fQIE=;
        b=QA/uCb4/g1ZRcJffBwMb8OdnnCxh+iWOrnHnID4Q2ldK9khpUf38D0FatH0CWkUj8Z
         A76TWGRb4AdIwRDvulI/WuIBQOfnA9cWzX1/a5BDNKaokeevQ1udgI2YhiA/20PiINOe
         gx8ffcFtmQmn2pRuOg5qhUwajqnSuENlzXqqpgNYTjHNqs4svrun4xL9yLTo7MFQt4Ip
         qCKQ8UFr3xjh8Kpl2XmJ8JMthUo+hXfoxfRc2qGhaWYepI8ZZn822iiLs1mayJailvUB
         mrzl2HxXLVUu75HmeUNmk8PyA7QYPuvLa+R3Wn2EjFwxuJrpIfZemjc6Z8eVBN66diH1
         +kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=R/dZ70tU/TxD2s4cM/VW4rskmb0fFyi+OQcBpX2fQIE=;
        b=PY7t+lbpXEzh0HfNaIuHiqNBSUPxAZrN8esEs96wChusZxA7lvI8gxxIM4pX+DS171
         gY0poRyWlSOTbltJ4fOiQYm8YTlKiu7wi1Vk7BaYUvkI9FteJfzWFkTKHvh1djcIbiyx
         fHXCvzBoOiDk8sbjbUZXwyP+/4M4Cs6nZOWfrx5JYhBXk2TCcqPtD6akLmnSqsR4y/7O
         mkgOg7DJx35EJ36NJyvH76s+kINiz3+6EHELXUIVluoDxVUD7p5+9dUzM06OPjDc1tGq
         hpTM1Ui/cNxCNsVLBjyAa8zKILJPN5fLmOUrkHj3AcbGyFoT9OHUKR0yo6fyY6Dx4bTp
         8v+Q==
X-Gm-Message-State: AOAM533rwYPKeBJu/ttTnSMDDh6un8TC+q+tbJrRKcqCQWVHeUz+WJgH
        sGCGGe97TJ1sgtMLCO0pty/1fm84atYKSQ==
X-Google-Smtp-Source: ABdhPJxJSJ6zCT4d61r8fE3Kyktu+QddJ6vqyO6AIUNDnIDSMgUkadaR9CaPHMOYO/KxCulbsYv17g==
X-Received: by 2002:a50:8d54:: with SMTP id t20mr985172edt.288.1626124119495;
        Mon, 12 Jul 2021 14:08:39 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id ov38sm2020844ejb.105.2021.07.12.14.08.38
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 14:08:39 -0700 (PDT)
Date:   Mon, 12 Jul 2021 23:08:37 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod] How stable is the v2 API?
Message-ID: <20210712210836.GA3636@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I'm working on a project that requires GPIO debouncing and is planned
to use libgpiod.  But debouncing is only available on the unreleased
next/libgpiod-2.0 branch.

What we'd like to know is whether the current C API on that branch is
expected to change much before release.  I don't expect any commitment
to API or ABI stability, but it would be helpful to have some
indication of how much change is likely to be needed in a client that
is written for the current API.

Thanks,

Ben.

