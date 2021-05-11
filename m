Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBC637A4EB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 May 2021 12:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhEKKt3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 May 2021 06:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbhEKKt2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 May 2021 06:49:28 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A57C061574
        for <linux-gpio@vger.kernel.org>; Tue, 11 May 2021 03:48:22 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id b131so25708897ybg.5
        for <linux-gpio@vger.kernel.org>; Tue, 11 May 2021 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=4Fi+lUNU3jDf/s7zaQekSPqMgipjsFvVBc8ZBp3thgM=;
        b=ORCdqrK+YpO141FhVp1cP2CqRkJ75Pu8u3Xx4P1lu1BQC/hWDllp3BTyvDLMBpnxZQ
         YtQhCYpGPjf1uWJ8EtMecQ4DrvkP1eBvEZaMwYjUNruagRCjQht8kLtkSpz2jPISDXkr
         zSdHT+nZWTNr89cQsyVTKdJm/7oL1FMkVLDyEmjRk3sYkF8275UpTUCw4KSdDOCgBHif
         +awcbztXhhMqy3tb3R0l+OQgPCNy+o5Ib/yNpOEKKX9uvLSvEJkhWDA9CvgskBTo5vsf
         BM72OG7Z41XFrqRngmvWZ0m/9RyErh8yWlHpAnr4GALELq4444GNTEUUnTU3ycISNWxE
         FhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=4Fi+lUNU3jDf/s7zaQekSPqMgipjsFvVBc8ZBp3thgM=;
        b=JEZuKSzhfRctPcFsabtf4MlLLlGynrGzvlTpI2zK+t80JGrEWj9CgpOldlq9N84y/j
         ivOZm9nwBa2/mygMZ/CU2/F4VgsBYjJ0Xrlto9lft5zPCvXeIQbTMDiBfomQvGelqrzd
         C3b1/90KPtUQwV4SZTedz8R12Jt/TvKSMtD0v/7wUn95+SRPKVQu8vREXH/hjodgeZnT
         5EgRFCmllga+CGpfiPkMGdYNFRuzS9dPQEhI/PRpMxTUB5uVV6BfUfmCyGHGobjRCIaC
         ztluPVzrU9D3Gl2NE4qu1TLmjhxnqgkI2Pu/gfSxt0QrMBKmvDXtdUGF5KtPb3S0ahHa
         Jj6g==
X-Gm-Message-State: AOAM532FdU6h1/Ug8vZmAJJ0lCPVKZmbUnAJY+IIHmBwNqYZQgU3e0Cd
        lBNwAuvbZQDvfs834d8iPq6cALNQTkf4b9THXR0=
X-Google-Smtp-Source: ABdhPJzM0BwPpUSWOka6HkKHnBeXu+k6OK+hmq+Fhx+kDctNly3GXcgtn6lCwt6c/pWQexNR3xSsX+Z2LBX+P7zok1g=
X-Received: by 2002:a25:34d3:: with SMTP id b202mr3723180yba.513.1620730101943;
 Tue, 11 May 2021 03:48:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:a0ca:b029:b6:c217:1fb8 with HTTP; Tue, 11 May 2021
 03:48:21 -0700 (PDT)
Reply-To: stephenbordeaux@yahoo.com
From:   Stephen Bordeaux <jeswa7m@gmail.com>
Date:   Tue, 11 May 2021 11:48:21 +0100
Message-ID: <CACGCBD4BnA=vaXW24pDSOL1=QGCm2D+d596Ljwg8N43rtB+r-g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Guten Morgen, ich bin Rechtsanwalt Stephen Bordeaux, Anwalt in der
Anwaltskanzlei Bordeaux. Ich habe Sie bez=C3=BCglich des kontaktiert
Eigentum des verstorbenen Dr. Edwin sollen 8,5 Millionen Dollar sein
R=C3=BCckkehrer auf Ihr Konto. Auch in dieser Transaktion m=C3=B6chte ich d=
ass
Sie vertraulich antworten. Stephen Bordeaux
