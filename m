Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9BB478B3E
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 13:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236062AbhLQMSP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 07:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235793AbhLQMSP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 07:18:15 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B30C06173E
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 04:18:15 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id r5so1917089pgi.6
        for <linux-gpio@vger.kernel.org>; Fri, 17 Dec 2021 04:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PgAQMoF3FxS7poQ4mxvqYG6svwwslz8uWPPj24m9se8=;
        b=Iofd42j4mTOfr0SG+Evy5gGD5mw+5PXFf2rxKMxLAn6HcrjQB/xGKPlYZw3PMWJS+4
         c12KQ5Eogt2y6DsJpyo1VUieWzFjUmq1PjAutPukvsTn3nWth5Y+2Fy/+stobWMz/U6E
         87Ml2KUdWmM9b57NNN0KzIlStoXlKeCHKHtO6f7K0SUMrdVWt7f1uNYZ0RPM2WjEPYCl
         USFoc4+BBOMm4TbhaZVNKlCopODsxDOhgtYXxQNOSWDFObeIlE8K9BU3N9GI+dNeSAA3
         wfn8aO9MWb5MYO5Qt8mdy28bMnESuJWbMmAqpAaChEHb4MqO8Jl2IhO6BKKRcZhVx9oh
         gaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PgAQMoF3FxS7poQ4mxvqYG6svwwslz8uWPPj24m9se8=;
        b=xLTcBaPcwWBGFgA1VIFfeYN7WPSeY8DJTtQb+c3bP/aS6NMg9fLqRXO6lkJd+Sz8bl
         oSfxMglWEXY5uYXvODfZLjGvQFqwdZiJFaJxvX0t4TYyCYc+jcq/J5OB83jef4A09vL4
         DzdI9jH+ci28FXJG702+ktqsGBTw2Urs0j8ZQcA/Poi68zYuFIdl4yBVAOGz8OQz6Glx
         5++xUvLnvtLJOmyxSr0ZkuVgA7oXnxVaGbsMbcrNZEGGd+q50qYBHv5hePO5z+erPmD4
         PRQ20CSW/ziA9bTLwM/cP1/Ml34DAtoi5BNHCZz4951tqZ2acFTg0lTxP+8/5iu7EEvZ
         Mqgw==
X-Gm-Message-State: AOAM531Os1WBPvXE/Ttuxfp7NVgoWG2nKA/dHBizzMxuhpC6aUA16rOs
        ZwYM6ylk2QvC+9A7xAI570sLEzLfHpk6G+dcccw=
X-Google-Smtp-Source: ABdhPJylU40kUwGUIr+LpOSZLJp1W+S1gJU/w3SokSll/EKJGwPkgmpVkEgMvb5gLdSuUNeO4i+q7ICiMZIt0aPEUbk=
X-Received: by 2002:a65:418b:: with SMTP id a11mr2671509pgq.620.1639743494651;
 Fri, 17 Dec 2021 04:18:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:cd15:0:0:0:0 with HTTP; Fri, 17 Dec 2021 04:18:14
 -0800 (PST)
Reply-To: johnjake628@gmail.com
From:   =?UTF-8?B?QnJ5YW7CoEpvaG5zb27CoMKgU2NvdGlucw==?= 
        <veronicegbenou@gmail.com>
Date:   Fri, 17 Dec 2021 13:18:14 +0100
Message-ID: <CAKidhb+YZwqtrLjJgC1rqqmDfjTWmLnfSFbR03_1AakpS5_KLw@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Have you received my first message to you
