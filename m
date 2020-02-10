Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C35481572FA
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 11:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJKqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 05:46:15 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:33205 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgBJKqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 05:46:15 -0500
Received: by mail-io1-f46.google.com with SMTP id z8so7059583ioh.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 02:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=geoffrey-id-au.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=rQ1woM9fN4yRdu06zIzaO5A5l2NLePrcaBZqjTl2Vu0=;
        b=XDRBr+V551p8L4jBMsagLZN7awO464tnqdGQEtHMiiUBO+PWgu3aP+z5s++qLhlxEF
         FNNvWrlXy6GQozNuMJcTRRcdBUCWN15hHrbGaWbapTwaUgDkLh8rxZJv6zsrqTF0SJw4
         hjZI3q+SxaFZ31IjPUTAmwY76KyhWdIOnKN4WN1EKPhZ82CLSBAbmilOJG2GbTbF/fVG
         aBOL7XHgtZriKbeLKzeyy+dKqWXPYpYjcIGvjXbZQiJxvbloxIMgEmCkvshEpGo2teKG
         mFGBqP0oUm/hhQV7IUFqU0ys5Uodem0C0yDgmIkbDyScZ+Ptsct9V8AvMm+RY9+QeTTT
         W2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=rQ1woM9fN4yRdu06zIzaO5A5l2NLePrcaBZqjTl2Vu0=;
        b=LTgvTdet1SDBwN+MRviqfJetJNZmhbmSBG4PaSZpzYqMVrSGggEQdUu8CCjvw/8xaB
         Ur6J+Pv+lzxJE/wUVbSOk+NDp9NlDchiGWLmCfdyzv3UgTw2nJYv+Rtyw230wizY51zJ
         ntGNjbjVywCj6T918h4fHyHR+KGWyjtutnzwOmi/LmR3m24eN4yHRnWMy0GEw9SZ68A/
         xkCgb5iWMNqr7R6xr1rqeW1NFiwLjGL7sHdNxL90I85zOhTnqVMFMPSmlXPzrGxJ994a
         wtAqXDMIKRM0CRGatEwQ8xSh8TLejhtN4/RxXRf2HRRAGsxgqXiHnKd8WB4QM3JYtKE0
         Sx+g==
X-Gm-Message-State: APjAAAV/cRD1DG+KCBQmYAcOPFWrkBZG85WfV8wgB9DuQpMQvz+5pqSY
        EzbEOR4fzFxxxCJv27jBB4JrvABVH1J3SLSKoDtLTaLu
X-Google-Smtp-Source: APXvYqw3NsedqLMyru+4Qqbb3idUn9cTPCcsmdKwGjhiz/8PYGnMiw3pZ6YJhQnaW7Hk4eeMeufQOKVnM6KE+4cD76U=
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr9598341jao.60.1581331574729;
 Mon, 10 Feb 2020 02:46:14 -0800 (PST)
MIME-Version: 1.0
References: <CADn0hExOJHS0OhU41sToXxqnqpyWjmCPrsVwXE-OKBLg-0dsRQ@mail.gmail.com>
In-Reply-To: <CADn0hExOJHS0OhU41sToXxqnqpyWjmCPrsVwXE-OKBLg-0dsRQ@mail.gmail.com>
From:   Geoffrey White <geoffrey@geoffrey.id.au>
Date:   Mon, 10 Feb 2020 21:46:03 +1100
Message-ID: <CADn0hEwXv1eyqMvPLshkPBOFukjza2nvScNNXw4U4L-K7dLHCw@mail.gmail.com>
Subject: Re: [libgpiod]
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

What a great library gpiod is. I am trying to port over my robot
software from WiringPi to it at the moment.  I am running Ubuntu 18.04
on both a development laptop and a Raspbery Pi 3 A+. I cross compile
version 1.4.2 and can run on the Pi and iterate over the detected
devices fine. However I'm not able to detect the correct chipset on
the device.

The Pi v3a+ uses the Broadcom chipset BCM2837B0, however the chip is
detected as a bcm2835 which is from the original Pi v1. Further, none
of the lines are labelled with a description. They all appear as
"unnamed" instead of labels such as  "GPIO_GCLK" or "GPIO17"

I heard the stock Kernel. on 18.04 (4.15) did have some issues,
however I have since upgraded to the 5.3.0 Kernal on both my dev
laptop and Pi.

I would personally like to keep to using the Ubuntu distribution for
the Pi, however perhaps it is better i revert back to Raspbian.

My future work I hope to integrate the DMA timing for a simple PWM
control using the gpiod, i'd like to help out with the project if I
can, sorry if I have approached the wrong email list.

 Regards,

Geoffrey.
