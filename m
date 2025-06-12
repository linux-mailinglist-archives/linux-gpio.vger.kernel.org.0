Return-Path: <linux-gpio+bounces-21483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969AAD7F43
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 01:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5D5216BBD5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 23:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2470C235070;
	Thu, 12 Jun 2025 23:58:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.wave.syn-alias.com (smtp.wave.syn-alias.com [129.159.93.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C371B0F19
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 23:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.159.93.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772702; cv=none; b=hWElPS5gcSli/uQtNyTYqgHxI93iipW6ERmP5fqAoVaeWHkUtJt2nmo7bDxkmrko7pD4jbnipMxpg/+bxYrElK1xnmWYz4sKcmrcSpP4CQtMYfPgcZv4yw2/1poUI8TcOJS02ZMaQvMcMTt8KbsE6sKNX0AIMTJP2lK9FVFU8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772702; c=relaxed/simple;
	bh=lrQGKwE+VaYwk9deuPXRXf8bLLhVF5ubni5d11LK/as=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=K5phpDduJWglokYtSx5SVF+RH3krdqm+9sW3sJTD8lOf0Fmmqv+NoHkNNDAAXbvODQjCP8ooHy+P2dFApXCI2BbAfL6gcQAAAYV8IVL/Jzaz4Fh6LO8pXn95NPclqZbUKc+xzt+eweOTMIKU8X+gKWx56I79adi7X0HyuRDv63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wavecable.com; spf=pass smtp.mailfrom=wavecable.com; arc=none smtp.client-ip=129.159.93.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wavecable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wavecable.com
X-Authed-Username: dG9tZGVhbkB3YXZlY2FibGUuY29t
Authentication-Results: smtp02.wave.email-ash1.sync.lan header.from=tomdean@wavecable.com; sender-id=softfail
Authentication-Results: smtp02.wave.email-ash1.sync.lan smtp.mail=tomdean@wavecable.com; spf=softfail; sender-id=softfail
Authentication-Results:  smtp02.wave.email-ash1.sync.lan smtp.user=<hidden>; auth=pass (PLAIN)
Received: from [24.113.94.117] ([24.113.94.117:57912] helo=[192.168.1.145])
	by mail.wavecable.com (envelope-from <tomdean@wavecable.com>)
	(ecelerity 4.8.0.74062 r(msys-ecelerity:tags/4.8.0-ga^0)) with ESMTPA
	id C0/63-03468-3996B486; Thu, 12 Jun 2025 19:58:12 -0400
Message-ID: <6f289fc5-d959-475d-9d75-0557c5bb8350@wavecable.com>
Date: Thu, 12 Jun 2025 16:58:11 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-gpio@vger.kernel.org
From: "Thomas D. Dean" <tomdean@wavecable.com>
Subject: [libgpiod] Version 2.3.0 fails with RPi OS with Kernel 6.12
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Vade-Verdict: clean
X-Vade-Analysis-1: dmFkZTED9wBvYF/1QZxbxuv+B6MuGHFXMak3/UCCE/TG11zEw3q1cBUpubbByODNNMTo7L5NPwyLcTD2
X-Vade-Analysis-2: pQn8XoVVugVglGC3Z/Gq4u3nQqEr8bZlxO+Te3vM14MsdODqetG55kepm2udBy2SOxqry1Di43kfFoxi
X-Vade-Analysis-3: VbEKFxeGOVqzZcThx9Nm/eOJtt9mdHrkPT1rWYc8CUDX6LPTVcnLNCTXe/G+Ac6b2GUDB0DXktRZy85f
X-Vade-Analysis-4: 3h0GiursMbMdZ3r2I4myp50NjmyZXHkW6TLPPkpHkkAh3isoCZvmKlrffH6rMBVPHy4uWiTf25eUgSro
X-Vade-Analysis-5: sjLqTXcYyDzi99H2+84Sw9bmg+ziZ5tbCO2RMx2RI3UfC+5s+9Wnl/go8rFiuf94fWPIH5tmy343jd51
X-Vade-Analysis-6: 9YBW/RXkgIZ4jZnceUAiQMLUbisv8BOjbKnVaav07h5YF6+2AdqAtjUI3dLLofwq+QX62ywdSW/+7zGZ
X-Vade-Analysis-7: Cl+7cX9GC/U15JST1Dm7trjZyy7TtG7xFOwoZKbwt96Sxx1Ul21j0wOLwP7etJbQQSMaUCrKGcjNPj9v
X-Vade-Analysis-8: XP9xwayfdZcyPq7+0HKWmgSi1qs02isI2xeI9r8FU4btlb1u5RmC3aNcR+8/ZAHig2B9lm4tGG5o2LUw
X-Vade-Analysis-9: r3uXAINQy0VcRxLMvi3OocyRwwk+/LOoCcYhDgQN+UiEZVUuBA
X-Vade-Client: WAVE

I installed gpiod version 2.3.0 on three RPi model 4.  All have the same 
RPi OS but different kernels. I name these rpi-4b-[1:3]

I have different results with the code at the bottom.

 > lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 12 (bookworm)
Release:	12
Codename:	bookworm

They have different kernels.  One rt10-v8 and two SMP PREEMP.

rpi-4b-1: works
 > uname -a
Linux rpi-4b-1 6.6.74+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.6.74-1+rpt1 
(2025-01-27) aarch64 GNU/Linu

rpi-4b-2: fails - Exception:  [Errno 16] Device or resource busy
 > uname -a
Linux rpi-4b-2 6.12.33-v8+ #1 SMP PREEMPT Thu Jun 12 06:11:58 PDT 2025 
aarch64 GNU/Linux

rpi-4b-3: works
 > uname -a
Linux rpi-4b-3 6.12.32-rt10-v8+ #1 SMP PREEMPT Thu Jun  5 19:06:02 PDT 
2025 aarch64 GNU/Linux

The code at the bottom, a simple chip.request_lines(...) works on 
rpi-4b-1 and rpi-4b-3, but, fails on rpi-4b-2.

These tests were run just after boot with no other user process running.

I did not make any kernel config changes other than the rt patch. I used 
patches-6.12.28-rt10.tar.xz as it seemed closest. There were no errors.

I guess the best way to proceed is with bisect. I have not done this for 
several years. But, what difference does rt10-v8 make? Maybe bisect from 
6.6.74 to 6.12.33?

Tom Dean

Code:
#!/bin/python

''' Setup one line '''

import gpiod
print('gpiod version ',gpiod.__version__)
from gpiod.line import Direction, Value, Edge

GPIO_CHIP = "/dev/gpiochip0"
SENS = 17
TRIG = 18

def main():
     chip = gpiod.Chip(GPIO_CHIP)

     my_config = {
         TRIG: gpiod.LineSettings(
             direction=Direction.OUTPUT,
             output_value=Value.ACTIVE
         ),
     }
     print(type(my_config))
     print(my_config)

     request = None

     try:
         request = chip.request_lines(consumer='main',
                                      config = my_config, )
     except Exception as e:
         print('Exception: ',e)

     if request:
         print(request)

     chip.close() ## exit gpiod

if __name__ == '__main__':
     main()

Working output from rpi-4b-3:
 > ~/aorus/work/Python/one-line.py
gpiod version  2.3.0
<class 'dict'>
{18: gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, 
edge_detection=gpiod.line.Edge.NONE, bias=gpiod.line.Bias.AS_IS, 
drive=gpiod.line.Drive.PUSH_PULL, active_low=False, 
debounce_period=datetime.timedelta(0), 
event_clock=gpiod.line.Clock.MONOTONIC, 
output_value=gpiod.line.Value.ACTIVE)}
<LineRequest chip="gpiochip0" num_lines=1 offsets=[18] fd=4>

Failing output from rpi-4b-2:
 > ~/aorus/work/Python/one-line.py
gpiod version  2.3.0
<class 'dict'>
{18: gpiod.LineSettings(direction=gpiod.line.Direction.OUTPUT, 
edge_detection=gpiod.line.Edge.NONE, bias=gpiod.line.Bias.AS_IS, 
drive=gpiod.line.Drive.PUSH_PULL, active_low=False, 
debounce_period=datetime.timedelta(0), 
event_clock=gpiod.line.Clock.MONOTONIC, 
output_value=gpiod.line.Value.ACTIVE)}
Exception:  [Errno 16] Device or resource busy

